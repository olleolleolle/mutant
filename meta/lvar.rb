# encoding: utf-8

Mutant::Meta::Example.add do
  source 'a = nil; a'

  mutation 'a = nil; nil'
  mutation 'a = nil'
  # TODO: fix invalid AST
  #   These ASTs are not valid and should NOT be emitted
  #   Mutations of lvarasgn need to be special cased to avoid this.
  mutation s(:begin, s(:lvasgn, :a__mutant__, s(:nil)), s(:lvar, :a))
  mutation s(:begin, s(:nil), s(:lvar, :a))
  mutation s(:lvar, :a)
end