import React, { useEffect, useState } from "react";
import RegisterComponent from "./RegisterComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "firebase/auth";
import { auth } from "../../../../firebaseConfig";
import Loader from "../../../common/Loader/Loader";

export default function Register() {
    const [loading, setLoading] = useState(true);
     let navigate = useNavigate();
    useEffect(() => {
        onAuthStateChanged(auth, (res) => {
            if (res?.accessToken) {
                navigate('/profile');
            } else {
                setLoading(false);
            };
        })
    }, []) 
    return  loading ? <Loader /> : <RegisterComponent />;
}
