import "./HeroSection.css";

import HeroText from "../HeroText";
import HeroActions from "../HeroActions";
import HeroBadge from "../HeroBadge";
import HeroStats from "../HeroStats";
import HeroImage from "../HeroImage";
import ScrollHint from "../ScrollHint";

export default function HeroSection() {
  return (
    <section className="hero-section">

      <div className="hero-content">

        <HeroText />

        <HeroActions />

        <HeroBadge />

        <HeroStats />

      </div>

      <HeroImage />

      <ScrollHint />

    </section>
  );
}