module lang::ql::tests::forms::SemanticChecker

import Set;
import lang::ql::analysis::SemanticChecker;
import lang::ql::ast::AST;
import lang::ql::tests::ParseHelper;
import util::IDE;

private set[Message] semanticChecker(loc f) = 
  semanticChecker(parseForm(f));
  
private bool semanticChecker(loc f, int numberOfWarnings, int numberOfErrors) {
  messages = semanticChecker(f);
  
  warnings = {m | m <- messages, warning(_, _) := m};
  errors = {m | m <- messages, error(_, _) := m};
  
  return (size(warnings) == numberOfWarnings) && (size(errors) == numberOfErrors);
}
  
public test bool semanticTestBasicForm() = 
  semanticChecker(|project://QL-R-kemi/forms/basic.q|, 0, 0);
  
public test bool semanticTestCalculatedField() = 
  semanticChecker(|project://QL-R-kemi/forms/calculatedField.q|, 0, 0);
  
public test bool semanticTestCommentForm() = 
  semanticChecker(|project://QL-R-kemi/forms/comment.q|, 0, 0);
  
public test bool semanticTestDuplicateLabels() = 
  semanticChecker(|project://QL-R-kemi/forms/duplicateLabels.q|, 0, 3);
  
public test bool semanticTestIfCondition() = 
  semanticChecker(|project://QL-R-kemi/forms/ifCondition.q|, 0, 0);
  
public test bool semanticTestIfElseCondition() = 
  semanticChecker(|project://QL-R-kemi/forms/ifElseCondition.q|, 0, 0);
  
public test bool semanticTestIfElseIfCondition() = 
  semanticChecker(|project://QL-R-kemi/forms/ifElseIfCondition.q|, 0, 4);
  
public test bool semanticTestIfElseIfElseCondition() = 
  semanticChecker(|project://QL-R-kemi/forms/ifElseIfElseCondition.q|, 2, 6);
  
public test bool semanticTestMultipleQuestions() = 
  semanticChecker(|project://QL-R-kemi/forms/multipleQuestions.q|, 0, 0);
  
public test bool semanticTestNestedIfElseIfElseCondition() = 
  semanticChecker(|project://QL-R-kemi/forms/nestedIfElseIfElseCondition.q|, 4, 11);
  
public test bool semanticTestUglyFormattedForm() = 
  semanticChecker(|project://QL-R-kemi/forms/uglyFormatted.q|, 2, 7);
  
public test bool semanticTestUndefinedVariableForm() = 
  semanticChecker(|project://QL-R-kemi/forms/undefinedVariable.q|, 0, 3);