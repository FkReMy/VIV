import { useState, useEffect } from 'react';
import FeedPostsComponent from "./FeedPostsComponent";
import "./FeedPostsComponent.scss";
import { getStatus } from '../../../../api/FirestoreAPIs';

export default function FeedPosts() {
    const [allStatuses, setAllStatuses] = useState([]);

    useEffect(() => {
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
}
