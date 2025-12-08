import { useEffect, useState } from "react";
import Feed from "../FeedScreen/Feed/Feed";
import { getCurrentUser } from "../../../api/FirestoreAPIs";
import SignedScreensNav from "../SignedScreensNav/SignedScreensNav";

export default function FeedLayout() {
    const [currentUser , serCurrentUser] = useState ({});
    useEffect (() => {
        getCurrentUser(serCurrentUser);
    }, [])
    return (
        <div>
            <SignedScreensNav />
            <Feed currentUser={currentUser}/>
        </div>
    );

}