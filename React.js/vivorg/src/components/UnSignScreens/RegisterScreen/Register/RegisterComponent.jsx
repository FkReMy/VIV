import React, { useState } from "react";
import { RegisterAPI, GoogleSignInAPI } from "../../../../api/AuthAPI";
import { toast } from "react-toastify";
import GoogleButton from 'react-google-button'
import { useNavigate } from "react-router-dom";
import "./RegisterComponent.scss";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import Col from 'react-bootstrap/Col';
import { postUserData } from "../../../../api/FirestoreAPIs";




export default function RegisterComponent() {
    let navigate = useNavigate();
    const [credentails, setCredentials] = useState({});
    const Register = async () => {
        try {
            let res = await RegisterAPI(credentails.email, credentails.password);
            toast.success("You have Joined the V I V world!");
            navigate('/profile');
            postUserData({
                name: credentails.name,
                email: credentails.email,
            });
            localStorage.setItem('userEmail', res.user.email);
        }
        catch (err) {
            toast.error("Cannot create your Account");
        }
    }
    // const googleSignIn = () => {
    //     let response = GoogleSignInAPI();
    //     toast.success("You have Joined the V I V world!");
    //     navigate('/profile');
    // }

    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <Col>
                <Form className="Register-container">
                    <Form.Group className="Registerform">
                        <Form.Text className='Registerform-title'>Register</Form.Text>
                        <Form.Text className="Registerform-subtitle">Make the most of your professional Business</Form.Text>
                        <Form.Control
                            onChange={(event) =>
                                setCredentials({ ...credentails, name: event.target.value })
                            }
                            type='text'
                            className='Register-input'
                            placeholder='Your Name'
                        />
                        <Form.Control
                            onChange={(event) =>
                                setCredentials({ ...credentails, email: event.target.value })
                            }
                            type='email'
                            className='Register-input'
                            placeholder='Email or Phone'
                        />
                        <Form.Control
                            onChange={(event) =>
                                setCredentials({ ...credentails, password: event.target.value })
                            }
                            type='password'
                            className='Register-input'
                            placeholder='Password'
                        />
                        <Form.Text className="Registerform-passwordHelp" id="passwordHelpBlock" muted>
                            Your password must be 8-20 characters long, contain letters and numbers,
                            special characters, and must not contain spaces, or emoji.
                        </Form.Text>
                        <Button onClick={Register} className="Registerbtn">
                            Agree & Join
                        </Button>
                        {/* <hr class="Registerhr" data-content="or" />
                        <GoogleButton className="Registerbtn-g"
                            onClick={googleSignIn}
                        /> */}
                        <Form.Text className="Registerform-subtitle">Have an account?   <span className="login-now" onClick={() => navigate('/login')}> Sign in</span></Form.Text>
                    </Form.Group>
                </Form>
            </Col>
        </ThemeProvider >

    )

}