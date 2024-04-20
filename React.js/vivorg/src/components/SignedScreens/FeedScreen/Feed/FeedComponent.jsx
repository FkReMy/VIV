import React, { useMemo, useState } from "react";
import "./FeedComponent.scss";
import FeedCreatePost from "../FeedCreatePost/FeedCreatePost";
import FeedPosts from "../FeedPosts/FeedPosts";
import { getCurrentUser } from "../../../../api/FirestoreAPIs";

export default function FeedComponent({}) {
    const [currentUser , serCurrentUser] = useState ({});
    useMemo (() => {
        getCurrentUser(serCurrentUser);
    })
    return (
            <div>
                <div className="feed-details">
                    <FeedCreatePost currentUser={currentUser}/>
                    <FeedPosts currentUser= {currentUser}/>
                </div>
            </div>
    )

}
