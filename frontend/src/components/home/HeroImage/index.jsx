import "./HeroImage.css";

import heroCar from "../../../assets/images/hero/porsche-gt3rs.png";

import SpecCard from "../SpecCard";

export default function HeroImage() {
  return (
    <div className="hero-image-container">
      <div className="hero-glow"></div>

      <img
        src={heroCar}
        alt="Porsche GT3 RS"
        className="hero-car"
      />

      <SpecCard />
    </div>
  );
}