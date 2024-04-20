import React, { useMemo, useState }  from "react";
import ProfileCardComponent from "./ProfileCardComponent";
import ProfileEdit from "../ProfileEdit/ProfileEdit";



export default function ProfileCard ({currentUser}) {


    return <ProfileCardComponent currentUser/>
};
