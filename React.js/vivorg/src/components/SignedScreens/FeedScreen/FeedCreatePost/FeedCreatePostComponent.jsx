import React, { useMemo, useState } from "react";
import "./FeedCreatePostComponent.scss";
import Card from "react-bootstrap/Card";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import { getCurrentTimeStamp } from '../../../../helpers/useMoment';
import { getCurrentUser } from '../../../../api/FirestoreAPIs';
import { PostStatus } from '../../../../api/FirestoreAPIs';
import { getUniqueID } from '../../../../helpers/getUniqueID';

export default function FeedCreatePostComponent() {
  const [currentUser , serCurrentUser] = useState ([]);
  useMemo (() => {
      getCurrentUser(serCurrentUser);
  });

  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const [status, setStatus] = useState('')
  const sendStatus = async () => {
    let object = {
      status: status,
      timeStamp: getCurrentTimeStamp("LLL"),
      userEmail: currentUser.email,
      userName: currentUser.name,
      postID: getUniqueID(),
    };
    await PostStatus(object);
    await setShow(false);
    await setStatus("");
  }

  return (
    <Container className="FeedCreatePost-Main">
      <Card className="FeedCreatePost-Create">
        <Button className='OpenPostModal' variant="primary" onClick={handleShow}>
          Start a Post...
        </Button>
        <Modal
          show={show}
          onHide={handleClose}
          backdrop="static"
          keyboard={false}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          centered
        >
          <Modal.Header closeButton>
            <Modal.Title>
              Create a Post
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group >
                <Form.Control
                  className='PostModal-input'
                  type="text"
                  as="textarea"
                  placeholder="What do you want to take about?"
                  autoFocus
                  onChange={(event) => setStatus(event.target.value)}
                  value={status}
                />
              </Form.Group>
            </Form>
          </Modal.Body>
          <Modal.Footer>
            <Button
              className='PostModalbtn'
              key={SubmitEvent}
              type='primary'
              variant="secondary"
              onClick={sendStatus}
              disabled={(status.length > 0) ? false : true}
            >Post</Button>
          </Modal.Footer>
        </Modal>
      </Card>
    </Container>

  )

}


