import React, { useMemo, useState } from "react";
import Profile from "./Profile/Profile";
import { getCurrentUser } from "../../../api/FirestoreAPIs";
import SignedScreensNav from "../SignedScreensNav/SignedScreensNav";

export default function ProfileLayout() {
    const [currentUser , serCurrentUser] = useState ({});
    useMemo (() => {
        getCurrentUser(serCurrentUser);
    })
    
    return (
        <div>
            <SignedScreensNav />
            <Profile currentUser={currentUser}/>
        </div>
    );

}