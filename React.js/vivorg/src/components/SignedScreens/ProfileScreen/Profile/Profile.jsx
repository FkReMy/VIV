/* eslint-disable react/prop-types */
import { useEffect, useState } from "react";
import ProfileComponent from "./ProfileComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "../../../../api/AuthAPI";
import Loader from "../../../common/Loader/Loader";

export default function Profile({currentUser}) {

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
    return  loading ? <Loader /> :  <ProfileComponent currentUser={currentUser}/>;
}
