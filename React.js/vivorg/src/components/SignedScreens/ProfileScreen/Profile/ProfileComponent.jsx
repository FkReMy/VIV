import React, { useMemo, useState } from "react";
import "./ProfileComponent.scss";
import { getCurrentUser } from "../../../../api/FirestoreAPIs";
import ProfileCard from "../ProfileCard/ProfileCard";

export default function ProfileComponent({}) {
    const [currentUser , serCurrentUser] = useState ({});
    useMemo (() => {
        getCurrentUser(serCurrentUser);
    })


    return (
            <div>
                <div className="feed-details">
                    {<ProfileCard currentUser/> }
                </div>
            </div>
    )

}
