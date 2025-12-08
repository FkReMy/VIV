/* eslint-disable react/prop-types */
import { useEffect, useState } from "react";
import ProfileEditComponent from "./ProfileEditComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "../../../../api/AuthAPI";
import Loader from "../../../common/Loader/Loader";

export default function ProfileEdit ({currentUser}) {
    const [loading, setLoading] = useState(true);
    let navigate = useNavigate();
    useEffect(() => {
        onAuthStateChanged((res) => {
            if (!res?.accessToken) {
                navigate('/login');
            } else {
                setLoading(false); 
            }
        })
    }, [navigate])
    return  loading ? <Loader /> :  <ProfileEditComponent currentUser={currentUser}/>;
 
}
