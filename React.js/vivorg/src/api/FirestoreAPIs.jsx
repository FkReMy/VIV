import { firestore } from "../firebaseConfig"
import { addDoc, collection, onSnapshot, doc, updateDoc} from "firebase/firestore"
import { toast } from "react-toastify";

let userRef = collection(firestore, "users");
let postsRef = collection(firestore, "posts");


export const PostStatus = (object) => {

    addDoc(postsRef, object)
    .then(() => {
        toast.success("Posted successfully");
    })
    .catch((err) => {
        console.log(err);
    })
};

export const getStatus = (setAllStatuses) => {
    onSnapshot(postsRef, (response) => {
        setAllStatuses(response.docs.map((docs) => {
            return{ ...docs.data(), id: docs.id };
        }))
    } )
};

export const postUserData = (object) => {
  addDoc(userRef, object)
    .then(() => {})
    .catch((err) => {
      console.log(err);
    });
};

export const getCurrentUser = (setCurrentUser) => {
  onSnapshot(userRef, (response) => {
    setCurrentUser(
      response.docs
        .map((docs) => {
          return { ...docs.data(), id: docs.id };
        })
        .filter((item) => {
          return item.email === localStorage.getItem("userEmail");
        })[0]
    );
  });
};

export const editProfile = (userID, payload) => {
  let userToEdit = doc(userRef, userID);

  updateDoc(userToEdit, payload)
    .then(() => {
      toast.success("Profile has been updated successfully");
    })
    .catch((err) => {
      console.log(err);
    });
};
