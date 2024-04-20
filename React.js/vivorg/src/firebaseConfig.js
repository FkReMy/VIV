// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore"

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCuupa0XbJmuZD8b_Wx1URtxBfY2ZdV6aA",
  authDomain: "v-i-v-org.firebaseapp.com",
  projectId: "v-i-v-org",
  storageBucket: "v-i-v-org.appspot.com",
  messagingSenderId: "788524645419",
  appId: "1:788524645419:web:cb1f2d681b424db196be6e",
  measurementId: "G-EPDWLT5H4R"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const firestore = getFirestore(app);

export { auth, firestore, app };