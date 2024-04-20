import React from "react";
import HomeNav from "../HomeScreen/HomeNav/HomeNav";
import Home from "../HomeScreen/Home/Home";
import Homewave from "../HomeScreen/Homewave/Homewave";
import HomeInfo from "./HomeInfo/HomeInfo";
import { useNavigate } from "react-router-dom";
import HomeHearMoreComponent from "./HomeHearMore/HomeHearMoreComponent";
import HomeFeed from "./HomeFeed/HomeFeed";
import HomeBoxes from "./HomeBoxes/HomeBoxes";
import HomeQoutes from "./HomeQoutes/HomeQoutes";
import Footer from "../common/Footer/Footer";
import ThemeProvider from 'react-bootstrap/ThemeProvider';


export default function HomeLayout() {

    let navigate = useNavigate();

    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <div>

                <HomeNav />
                <Home />
                <Homewave />
                <HomeInfo />
                <HomeFeed />
                <HomeBoxes />
                <HomeHearMoreComponent />
                <HomeQoutes />
                <Footer />

            </div>
        </ThemeProvider >


    );

}