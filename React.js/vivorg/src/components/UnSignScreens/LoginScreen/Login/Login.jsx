import React, { useEffect, useState } from "react";
import LoginComponent from "./LoginComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "firebase/auth";
import { auth } from "../../../../firebaseConfig";
import Loader from "../../../common/Loader/Loader";

export default function Login() {
    const [loading, setLoading] = useState(true);
     let navigate = useNavigate();
    useEffect(() => {
        onAuthStateChanged(auth, (res) => {
            if (res?.accessToken) {
                navigate('/feed');
            } else {
                setLoading(false);
            };
        })
    }, []) 
    return  loading ? <Loader /> : <LoginComponent />;
}

