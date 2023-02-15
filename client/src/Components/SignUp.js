import { useState } from "react";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { Link } from "react-router-dom";

function SignUp({setCurrentUser}){


    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    // const [login, setLogin] = useState("")
    const [errors, setErrors] = useState([])

    function validateForm() {
        return email.length > 0 && password.length > 0;
    }


    function onSubmit(e){
        e.preventDefault()
        const user = {
            email,
            password
        }
        fetch('/auth',{
            method: "POST",
            headers:{'Content-Type': 'application/json'},
            body:JSON.stringify(user)
    })
    .then(res => {
        if(res.ok){
          res.json().then(user => setCurrentUser(user))
        } else{
            res.json().then( errors => setErrors(errors))
        }
    })
}

return (
    <div className="SignUp">
      <Form onSubmit={onSubmit}>
        <Form.Group size="lg" controlId="email">
          <Form.Label>Email</Form.Label>
          <Form.Control
            autoFocus
            name="email"
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </Form.Group>
        <Form.Group size="lg" controlId="password">
          <Form.Label>Password</Form.Label>
          <Form.Control
            name="password"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </Form.Group>
        <Button block size="lg" type="submit" disabled={!validateForm()}>
          SignUp
        </Button>
        
      </Form>
      <Button><Link to="/signup"> Already have an account? Sign in</Link></Button>
    </div>

  );

}

export default SignUp