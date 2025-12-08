import { useEffect, useState } from "react";
import Profile from "./Profile/Profile";
import { getCurrentUser } from "../../../api/FirestoreAPIs";
import SignedScreensNav from "../SignedScreensNav/SignedScreensNav";

export default function ProfileLayout() {
    const [currentUser , serCurrentUser] = useState ({});
    useEffect (() => {
        getCurrentUser(serCurrentUser);
    }, [])
    
    return (
        <div>
            <SignedScreensNav />
            <Profile currentUser={currentUser}/>
        </div>
    );

}