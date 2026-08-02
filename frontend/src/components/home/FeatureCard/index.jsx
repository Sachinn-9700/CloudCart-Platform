import "./FeatureCard.css";

export default function FeatureCard({ feature }) {
  return (
    <article className="feature-card">
      <h3>{feature.title}</h3>

      <p>{feature.description}</p>
    </article>
  );
}
