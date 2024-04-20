import React, { useMemo, useState } from "react";
import "./ProfileCardComponent.scss";
import { getCurrentUser } from "../../../../api/FirestoreAPIs";
import Card from "react-bootstrap/Card";
import Container from "react-bootstrap/Container";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';
import { AiOutlineEdit } from 'react-icons/Ai';
import ProfileEdit from "../ProfileEdit/ProfileEdit";
import { Navigate } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { getStatus } from '../../../../api/FirestoreAPIs';
import FeedPostsComponent from "../../FeedScreen/FeedPosts/FeedPostsComponent";


export default function ProfileCardComponent({ }) {
    let navigate = useNavigate();
    const [currentUser, setCurrentUser] = useState({});
    useMemo(() => {
        getCurrentUser(setCurrentUser);
    })
    const [allStatuses, setAllStatuses] = useState([]);
    useMemo(() => {
        getStatus(setAllStatuses)
    }, [])



    return (
        <div>
        <Container className="profileCard-Main">
            <Card className="profileCard-render">
                <div><Button onClick={() => navigate('/profileedit')} className="profileedit" > <AiOutlineEdit size={40} /></Button></div>
                <div>
                    <div>
                        <Row>
                            <Col>
                                <Row className="profileuser">
                                    <h3 className="profileusername">{currentUser.name}</h3>
                                    <p className="profileuseremail">{currentUser.email}</p>
                                    <p className="profileuseremail">{currentUser.headline}</p>
                                    <p className="profileuseremail">{currentUser.location}</p>
                                </Row>
                            </Col>
                            <Col>
                                <Row>
                                    <p className="profileuseremail">{currentUser.company}</p>
                                    <p className="profileuseremail">{currentUser.collage}</p>
                                </Row>
                            </Col>
                        </Row>
                    </div>
                </div>
            </Card>
        </Container>
        <div>
        {allStatuses.filter((item) => {
            return item.userEmail === localStorage.getItem("userEmail")
        }).map((posts) => {
          return (
            <div key={posts.id}>
              <FeedPostsComponent posts={posts}/>
            </div>
          );
        })}
      </div>
        </div>
    )

}
