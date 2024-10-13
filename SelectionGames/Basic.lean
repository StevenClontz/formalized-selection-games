import Mathlib.Data.Set.Defs
import Mathlib.Data.Set.Operations
open Set Function

variable {X : Type}

structure SGame (X) where
  A : Set (Set X)
  B : Set (Set X)

structure SGame.Play (g : SGame X) where
  Moves₁ : ℕ → Set X
  Moves₂ : ℕ → X
  Legal₁ : ∀ n, Moves₁ n ∈ g.A
  Legal₂ : ∀ n, Moves₂ n ∈ Moves₁ n

def SGame.OneWins (g : SGame X) (p : g.Play) : Prop :=
  range p.Moves₂ ∈ g.B

def SGame.TwoWins (g : SGame X) (p : g.Play) : Prop :=
  ¬ g.OneWins p

structure SGame.OnePre (g : SGame X) where
  Moves : ℕ → Set X
  Legal : ∀ n, Moves n ∈ g.A

def SGame.Principle (g : SGame X) : Prop :=
  ∀ σ : g.OnePre, ∃ p : g.Play, p.Moves₁ = σ.Moves ∧ g.TwoWins p
