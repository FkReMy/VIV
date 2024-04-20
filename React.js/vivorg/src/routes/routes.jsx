import {
    createBrowserRouter,
  } from "react-router-dom";
import FeedLayout from "../components/SignedScreens/FeedScreen/FeedLayout"
import LoginLayout from "../components/UnSignScreens/LoginScreen/LoginLayout";
import RegisterLayout from "../components/UnSignScreens/RegisterScreen/RegisterLayout";
import UnderdevScreen from "../components/UnderdevScreen/UnderdevScreen";
import HomeLayout from "../components/HomeScreen/HomeLayout";
import ProfileLayout from "../components/SignedScreens/ProfileScreen/ProfileLayout";
import ProfileEditLayout from "../components/SignedScreens/ProfileScreen/ProfileEditLayout";


/* //Activate block when error occurs
export const router = createBrowserRouter([
  {
    path: "/",
    element: <UnderdevScreen />,
  },
]); */

//toggle block comment when error occurs
export const router = createBrowserRouter([
    {
      path: "/",
      element: <HomeLayout />,
    },
    {
      path: "/feed",
      element: <FeedLayout />,
    },
    {
      path: "/login",
      element: <LoginLayout />,
    },
    {
      path: "/register",
      element: <RegisterLayout />,
    },
     {
      path: "/profile",
      element: <ProfileLayout />,
    }, 
    {
      path: "/profileedit",
      element: <ProfileEditLayout />,
    }, 
  ]);