import { BrowserRouter, Routes, Route } from "react-router-dom";

import MainLayout from "../layouts/MainLayout";

import Home from "../pages/Home";
import Cars from "../pages/Cars";
import Bikes from "../pages/Bikes";
import VehicleDetails from "../pages/VehicleDetails";
import Cart from "../pages/Cart";
import Checkout from "../pages/Checkout";
import Login from "../pages/Login";
import Register from "../pages/Register";
import Profile from "../pages/Profile";
import NotFound from "../pages/NotFound";

export default function AppRoutes() {
  return (
    <BrowserRouter>
      <Routes>
        <Route element={<MainLayout />}>
          <Route path="/" element={<Home />} />
          <Route path="/cars" element={<Cars />} />
          <Route path="/bikes" element={<Bikes />} />
          <Route path="/cars/:id" element={<VehicleDetails />} />
          <Route path="/cart" element={<Cart />} />
          <Route path="/checkout" element={<Checkout />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/profile" element={<Profile />} />
          <Route path="*" element={<NotFound />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}