import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav>
      <Link to="/">CloudCart Motors</Link>

      <Link to="/cars">Cars</Link>

      <Link to="/bikes">Bikes</Link>

      <Link to="/cart">Cart</Link>

      <Link to="/profile">Profile</Link>
    </nav>
  );
}