import { useEffect, useState } from "react";
import RegisterComponent from "./RegisterComponent";
import { useNavigate } from "react-router-dom";
import { onAuthStateChanged } from "../../../../api/AuthAPI";
import Loader from "../../../common/Loader/Loader";

export default function Register() {
    const [loading, setLoading] = useState(true);
     let navigate = useNavigate();
    useEffect(() => {
        onAuthStateChanged((res) => {
            if (res?.accessToken) {
                navigate('/profile');
            } else {
                setLoading(false);
            }
        })
    }, [navigate]) 
    return  loading ? <Loader /> : <RegisterComponent />;
}
