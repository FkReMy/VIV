import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Offcanvas from 'react-bootstrap/Offcanvas';
import { useNavigate } from "react-router-dom";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import "./UnSignScreensMenuComponent.scss"
import { AiOutlineMenu } from 'react-icons/Ai';

export default function UnSignScreensMenuComponent({ ...props }) {
    let navigate = useNavigate();
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    return (
        <>
            <Button className='unSignScreensNavbtn' variant="primary" onClick={handleShow} >
            <AiOutlineMenu size={40} />
            </Button>
            <Offcanvas show={show} onHide={handleClose} {...props}>
                <Offcanvas.Header closeButton>
                    <Offcanvas.Title>Menu</Offcanvas.Title>
                </Offcanvas.Header>
                <Offcanvas.Body>
                    <Col>
                        <Row>
                            <Button className='offunSignScreensNavbtn' onClick={() => navigate('/')}>Home</Button>
                        </Row>
                        <Row>
                            <Button className='offunSignScreensNavbtn' onClick={() => navigate('/services')}>Services Provided</Button>
                        </Row>
                        <Row>
                            <Button className='offunSignScreensNavbtn' onClick={() => navigate('/team')}>Our Team</Button>
                        </Row>

                    </Col>
                </Offcanvas.Body>
                <svg id="info-waves" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#fff" fillOpacity="1" d="M0,160L48,149.3C96,139,192,117,288,144C384,171,480,245,576,240C672,235,768,149,864,96C960,43,1056,21,1152,48C1248,75,1344,149,1392,186.7L1440,224L1440,0L1392,0C1344,0,1248,0,1152,0C1056,0,960,0,864,0C768,0,672,0,576,0C480,0,384,0,288,0C192,0,96,0,48,0L0,0Z"></path></svg>

            </Offcanvas>
        </>
    );
}
