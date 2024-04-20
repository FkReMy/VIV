import React, { useMemo, useState } from "react";
import "./FeedPostsComponent.scss";
import Card from "react-bootstrap/Card";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Container from "react-bootstrap/Container";
import { getCurrentUser } from "../../../../api/FirestoreAPIs";

export default function FeedPostsComponent({ posts }) {
    const [currentUser , serCurrentUser] = useState ({});
    useMemo (() => {
        getCurrentUser(serCurrentUser);
    })
    return (
        <Container className="FeedPosts-Main">
            <Card className="FeedPosts-render">
                <Col>
                <Row className="postusername">
                    <p>{posts.userName}</p>
                </Row>
                <Row className="posttimeStamp">
                    <p>{posts.timeStamp}</p>
                </Row>
                <Row className="poststatus">
                    <p>{posts.status}</p>
                </Row>
                </Col>
               
            </Card>
        </Container>
    )
}