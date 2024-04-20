import React, { useEffect, useState } from "react";
import ProfileComponent from "./ProfileComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "firebase/auth";
import { auth } from "../../../../firebaseConfig";
import Loader from "../../../common/Loader/Loader";
import ProfileEdit from "../ProfileEdit/ProfileEdit";

export default function Profile({currentUser}) {

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
    return  loading ? <Loader /> :  <ProfileComponent currentUser={currentUser}/>;
};
