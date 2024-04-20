import React, { useState, useMemo } from 'react';
import FeedPostsComponent from "./FeedPostsComponent";
import "./FeedPostsComponent.scss";
import { getStatus } from '../../../../api/FirestoreAPIs';

export default function FeedPosts() {
    const [allStatuses, setAllStatuses] = useState([]);

    useMemo(() => {
        getStatus(setAllStatuses)
    }, [])
    return (
        <> {allStatuses.map((posts) => {
            return (
                <>
                    <FeedPostsComponent posts={posts} />
                </>
            )
        })}</>




    );
};
