import React, { useState } from 'react';
import "./HomeNavComponent.scss"
import { useNavigate } from "react-router-dom";
import Button from 'react-bootstrap/Button';
import Navbar from 'react-bootstrap/Navbar';
import HomeMenuComponent from '../HomeMenu/HomeMenuComponent';


export default function HomeNavComponent() {

  let navigate = useNavigate();
  return (
      <Navbar className='navbar'>
        <Button className="homeNavlogo" onClick={() => navigate('/')}>V I V</Button>
        <div className='nav'>
          <Button onClick={() => navigate('/login')} className='homeNavbtn'>Sign In</Button>
          <>
            {['end'].map((Menu, idx) => (
              <HomeMenuComponent key={idx} placement={Menu} name={Menu} />
            ))}
          </>
        </div>
      </Navbar>
  )
}

