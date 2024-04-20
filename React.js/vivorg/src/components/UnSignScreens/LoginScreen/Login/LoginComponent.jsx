import React, { useState } from "react";
import { LoginAPI, GoogleSignInAPI } from "../../../../api/AuthAPI";
import { toast } from "react-toastify";
import GoogleButton from 'react-google-button'
import { useNavigate } from "react-router-dom";
import "./LoginComponent.scss";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import Col from 'react-bootstrap/Col';


export default function LoginComponent() {
    let navigate = useNavigate();
    const [credentails, setCredentials] = useState({});
    const login = async () => {
        try {
            let res = await LoginAPI(credentails.email, credentails.password);
            toast.success("Signed In to V I V !");
            localStorage.setItem('userEmail', res.user.email);
            navigate('/feed');
        }
        catch (err) {
            toast.error("Please Check your Credentails");
        }
    }
    // const googleSignIn = () => {
    //     let response = GoogleSignInAPI();
    //     toast.success("Signed In to V I V !");
    //     navigate('/feed');
    // }

    return (

        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
                <Col>
                
                <Form className="login-container">
                    <Form.Group className="loginform">
                        <Form.Text className='loginform-title'>Sign In</Form.Text>
                        <Form.Text className="loginform-subtitle">Stay updated & Support your Business</Form.Text>
                        <Form.Control
                            onChange={(event) =>
                                setCredentials({ ...credentails, email: event.target.value })
                            }
                            className='login-input'
                            controlId="formBasicEmail"
                            type='email'
                            placeholder='Email or Phone'
                        />
                        <Form.Control
                            onChange={(event) =>
                                setCredentials({ ...credentails, password: event.target.value })
                            }
                            className='login-input'
                            controlId="formBasicPassword"
                            type='password'
                            placeholder='Password'
                        />
                        <Button onClick={login} className="loginbtn">
                            Sign In
                        </Button>
                        {/* <hr class="loginhr" data-content="or" />
                        <GoogleButton className="loginbtn-g"
                            onClick={googleSignIn}
                        /> */}
                        <Form.Text className="loginform-subtitle">New to V I V?   <span className="join-now" onClick={() => navigate('/register')}> Join Now</span></Form.Text>


                    </Form.Group>
                </Form>
                </Col>
  
        </ThemeProvider >

    );

}