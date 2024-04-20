import React, { useEffect, useState } from "react";import ProfileEditComponent from "./ProfileEditComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "firebase/auth";
import { auth } from "../../../../firebaseConfig";
import Loader from "../../../common/Loader/Loader";

export default function ProfileEdit ({currentUser}) {
    const [loading, setLoading] = useState(true);
    let navigate = useNavigate();
    useEffect(() => {
        onAuthStateChanged(auth, (res) => {
            if (!res?.accessToken) {
                navigate('/login');
            } else {
                setLoading(false); 
            };
        })
    }, [])
    return  loading ? <Loader /> :  <ProfileEditComponent currentUser={currentUser}/>;
 
};
