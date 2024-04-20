import {
    signInWithEmailAndPassword,
    createUserWithEmailAndPassword,
    GoogleAuthProvider,
    signInWithPopup,
    signOut
} from 'firebase/auth'
import { auth } from '../firebaseConfig'; 

export const LoginAPI = (email, password) => {
    try{
        let response = signInWithEmailAndPassword(auth, email, password)
        return response;
    }
    catch(err){
        return err;
    }
};

export const RegisterAPI = (email, password) => {
    try{
        let response = createUserWithEmailAndPassword(auth, email, password)
        return response;
    }
    catch(err){
        return err;
    }
};

export const GoogleSignInAPI = (email, password) => {
    try{
        let googleprovidr = new GoogleAuthProvider();
        let res = signInWithPopup(auth, googleprovidr);
        return res;
    }
    catch(err){
        return err;
    }
};

export const onLogout = () => {
    try{
        signOut(auth);
        return res;
    }
    catch(err){
        return err;
    }
};