import React, { useMemo, useState } from "react";
import { getCurrentUser } from "../../../api/FirestoreAPIs";
import SignedScreensNav from "../SignedScreensNav/SignedScreensNav";
import ProfileEdit from "./ProfileEdit/ProfileEdit";


export default function ProfileEditLayout() {
    const [currentUser , serCurrentUser] = useState ({});
    useMemo (() => {
        getCurrentUser(serCurrentUser);
    })
    
    return (
        <div>
            <SignedScreensNav />
            <ProfileEdit currentUser={currentUser}/>
        </div>
    );

}