import Mathlib.Data.Set.Defs
import Mathlib.Data.Set.Operations
open Set Function

variable {X : Type}

structure SGame (X) where
  A : Set (Set X)
  B : Set (Set X)

structure Play (g : SGame X) where
  Moves₁ : ℕ → Set X
  Moves₂ : ℕ → X
  Legal₁ : ∀ n, Moves₁ n ∈ g.A
  Legal₂ : ∀ n, Moves₂ n ∈ Moves₁ n

def OneWins (g : SGame X) (p : Play g) : Prop :=
  range p.Moves₂ ∈ g.B

def TwoWins (g : SGame X) (p : Play g) : Prop :=
  ¬ OneWins g p

structure OnePre (g : SGame X) where
  Moves : ℕ → Set X
  Legal : ∀ n, Moves n ∈ g.A

def SPrinciple (g : SGame X) : Prop :=
  ∀ σ : OnePre g, ∃ p : Play g, p.Moves₁ = σ.Moves ∧ TwoWins g p
