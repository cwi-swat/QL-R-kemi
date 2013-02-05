module lang::ql::syntax::Layout

syntax WhitespaceOrComment 
  = whitespace: Whitespace whitespace
  | comment: Comment comment
  ;

lexical Whitespace = [\u0009-\u000D \u0020 \u0085 \u00A0 \u1680 \u180E \u2000-\u200A \u2028 \u2029 \u202F \u205F \u3000];

layout Standard = WhitespaceOrComment* !>> [\ \t\n\f\r] !>> "//" !>> "/*";