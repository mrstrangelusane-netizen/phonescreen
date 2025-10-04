# Phone Screen Inventory - Deployment Instructions

## Option 1: Deploy Using Firebase Console (Easiest - 2 minutes)

### Step 1: Deploy Firestore Rules
1. Go to Firebase Console: https://console.firebase.google.com/project/imei-7c1cb/firestore/rules
2. Copy the content from `firestore.rules` file in this folder
3. Paste it in the Rules editor
4. Click **Publish**

### Step 2: Test the App
1. Simply open `index.html` in your web browser (Chrome/Edge recommended)
2. Click "Sign In with Google"
3. Start using the app!

---

## Option 2: Deploy Using Firebase CLI (Advanced)

### Step 1: Login to Firebase
```bash
firebase login
```

### Step 2: Deploy Firestore Rules
```bash
firebase deploy --only firestore:rules
```

### Step 3: (Optional) Deploy to Firebase Hosting
```bash
firebase deploy --only hosting
```
Your app will be live at: https://imei-7c1cb.web.app

---

## Option 3: Local Testing (No Deployment Needed)

1. Make sure you've enabled:
   - Google Authentication in Firebase Console
   - Created Firestore Database
   - Published Firestore Rules (Option 1 above)

2. Open `index.html` directly in your browser
3. That's it! The app connects to Firebase cloud services

---

## Firestore Rules (Copy this)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Phone Screen Inventory App Rules
    match /artifacts/phone-screen-inventory/public/data/{document=**} {
      allow read, write: if request.auth != null;
    }
    
    // Deny all other access
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

---

## Troubleshooting

### If login fails:
- Make sure Google Sign-in is enabled in Firebase Console
- Check browser console for errors (F12)

### If data doesn't save:
- Verify Firestore rules are deployed
- Check that Firestore database is created
- Look at browser console for permission errors

### Need help?
Check Firebase Console error logs at:
https://console.firebase.google.com/project/imei-7c1cb/overview

