import SelectionGames.Basic
import Mathlib.Topology.Instances.Real

open Set Filter Topology

variable (X : Type) [TopologicalSpace X] [Nonempty X]

def isOpenCover (U : Set ( Set X )) : Prop :=
  (∀ u ∈ U, IsOpen u) ∧ (∀ x : X, ∃ u ∈ U, x ∈ u)

def OpenCovers : Set ( Set ( Set X ) ) :=
  {U : Set ( Set X ) | isOpenCover X U }

def RothbergerGame : SGame ( Set X ) where
  A := OpenCovers X
  B := OpenCovers X

def Counter (p : (RothbergerGame X).OnePre) (Xcount : Countable X) : (RothbergerGame X).Play where
  Moves₁ := p.Moves
  Moves₂ := by
    intro n
    have h := (p.Legal n).2
    obtain ⟨ f, hf ⟩ := exists_surjective_nat X
    sorry
  Legal₁ := p.Legal
  Legal₂ := sorry

example (Xcount : Countable X) : (RothbergerGame X).Principle := by
  intro σ
  sorry
