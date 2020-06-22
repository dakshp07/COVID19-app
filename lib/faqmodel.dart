class FaqModel{
  String question;
  String answer;
  FaqModel({this.answer,this.question});
}

List<FaqModel>data =[
  new FaqModel(
    question: "What is the novel coronavirus?",
    answer: "This is a new strain of coronavirus that has not been previously identified in humans.Coronaviruses are a large family of viruses that are known to cause illness in humans and animals. In humans, this large family of viruses are known to cause illness ranging from the common cold to Severe Acute Respiratory Syndrome (SARS)",
  ),
  new FaqModel(
    question: "What are the symptoms of novel coronavirus?",
    answer: "In confirmed cases of illness in humans, common symptoms have been acute, serious respiratory illness with fever, cough, shortness of breath, and breathing difficulties. Based on current clinical experience, the infection generally presents as pneumonia. It has caused kidney failure and death in some cases. It is important to note that the current understanding of the illness caused by this infection is based on a limited number of cases and may change as more information becomes available."
  ),
  new FaqModel(
    question: "Can it be transmitted from person to person?",
    answer: "This is not known with certainty at this time. The cases occurring in the same family raises the possibility of limited human-to-human transmission. Alternatively, it is possible that the infected family members were exposed to the same source of infection, for example, in a household or workplace.",
  ),
  new FaqModel(
    question: "How could I become infected with this virus?",
    answer: "To date, we do not know how humans have become infected with this virus. Investigations are underway to determine the virus source, types of exposure that lead to infection, mode of transmission and the clinical pattern and course of disease."
  ),
  new FaqModel(
    question: "Is there a vaccine for the novel coronavirus?",
    answer: "There is no vaccine currently available.",
  ),
  new FaqModel(
    question: "Is there a treatment for the novel coronavirus?",
    answer: "There is no specific treatment for disease caused by novel coronavirus. However, many of the symptoms caused by this virus can be treated and therefore treatment should be based on the symptoms of the patient. Moreover, supportive care for infected persons can be highly effective.",
  ),
  new FaqModel(
    question: "What can I do to protect myself?",
    answer: "Exactly how people become infected with this virus is not known at this time. However, some general measures that would be prudent and help prevent the acquisition of any respiratory illness are to avoid close contact, when possible, with anyone who shows symptoms of illness (coughing and sneezing), and to maintain good hand hygiene.",
  ),
  new FaqModel(
    question: "How widespread is the novel coronavirus?",
    answer: "It is unknown how widespread this virus may be.WHO is encouraging Member States to continue to closely monitor for severe acute respiratory infections (SARI) and to carefully review any unusual patterns of SARI or pneumonia. WHO will continue to share information as it is made available.",
  ),
  new FaqModel(
    question: "Are health workers at risk from the novel coronavirus?",
    answer: "Health care workers come into contact with patients with many different infectious illnesses more often than the general public. Therefore WHO recommends that health care workers consistently apply appropriate infection prevention and control measures.",
  ),
  new FaqModel(
    question: "Is the novel coronavirus like SARS?",
    answer: "SARS is a coronavirus that was identified in 2003 and belongs to the same large family of viruses as the novel coronavirus. Therefore, SARS and the novel coronavirus are distantly related. Both viruses are capable of causing severe disease. However, they have important differences based on current information. Most importantly, the novel coronavirus does not appear to transmit easily between people while the SARS virus was much more transmissible.",
  ),
  new FaqModel(
    question: "Is it true that this novel coronavirus originated from bats?",
    answer: "This is one possibility but the origin of the virus has not yet been established.",
  ),
  new FaqModel(
    question: "Can humans become infected with novel coronavirus from animals? If so, which ones should we be concerned about?",
    answer: "WHO is closely monitoring the situation to identify how people are being exposed. There is currently no direct evidence that the human cases were exposed through direct contact with animals.",
  ),
];