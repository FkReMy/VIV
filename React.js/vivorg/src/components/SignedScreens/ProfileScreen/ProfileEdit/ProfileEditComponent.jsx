import React, { useMemo, useState } from "react";
import { getCurrentUser } from "../../../../api/FirestoreAPIs";
import Card from "react-bootstrap/Card";
import Container from "react-bootstrap/Container";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';
import { GiCancel } from 'react-icons/gi';
import { AiOutlineSave } from 'react-icons/Ai';
import ProfileEdit from "../ProfileEdit/ProfileEdit";
import { Navigate } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import "./ProfileEditComponent.scss";
import { editProfile } from "../../../../api/FirestoreAPIs";

export default function ProfileEditComponent({ currentUser }) {

    let navigate = useNavigate();

    const [editInputs, setEditInputs] = useState(currentUser);
    const getInput = (event) => {
      let { name, value } = event.target;
      let input = { [name]: value };
      setEditInputs({ ...editInputs, ...input });
    };
  
    const updateProfileData = async () => {
      await editProfile(currentUser?.id, editInputs);
    };

    return (
        <Container className="profileCard-Main">
            <Card className="profileCard-render">
                <Col>
                    <Row className="profileuser">

                        <input
                            onChange={getInput}
                            placeholder="Name"
                            className="profileusername"
                            name='name'
                        />

                        <input
                            onChange={getInput}
                            placeholder="Headline"
                            className="profileusername"
                            name='headline'
                        />

                        <input
                            onChange={getInput}
                            placeholder="Location"
                            className="profileusername"
                            name='location'
                        />

                        <input
                            onChange={getInput}
                            placeholder="Company"
                            className="profileusername"
                            name='company'
                        />

                        <input
                            onChange={getInput}
                            placeholder="Collage"
                            className="profileusername"
                            name='collage'
                        />

                    </Row>
                    <Row>
                        <Col>
                            <Button onClick={() => navigate('/profile')} className="profileedit" > <GiCancel size={40} /></Button>
                            <Button onClick={updateProfileData} className="profilesave" > <AiOutlineSave size={40} /></Button>
                        </Col>
                    </Row>
                </Col>




            </Card>
        </Container>
    );
}
