import { useEffect, useState } from "react";
import LoginComponent from "./LoginComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "../../../../api/AuthAPI";
import Loader from "../../../common/Loader/Loader";

export default function Login() {
    const [loading, setLoading] = useState(true);
     let navigate = useNavigate();
    useEffect(() => {
        onAuthStateChanged((res) => {
            if (res?.accessToken) {
                navigate('/feed');
            } else {
                setLoading(false);
            }
        })
    }, [navigate]) 
    return  loading ? <Loader /> : <LoginComponent />;
}

