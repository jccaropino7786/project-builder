import { Link } from "react-router-dom";

function NavBar(){
    return(
            <div id = "links">
            <ul className="nav" >
                <li>Log in/ Log out</li>
                <li><Link to="/">Home</Link></li>
                <li><Link to="projects">Projects</Link></li>
                <li><Link to="materials">Materials</Link></li>
                <li><Link to="new_project">New Project</Link></li>
            </ul>
        </div>
    )
}

export default NavBar