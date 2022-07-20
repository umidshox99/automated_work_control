class DocumentExchangeData {
  int? allAssignmentDocuments;
  int? assignmentUnreadDocuments;
  int? allToViewDocuments;
  int? unreadToViewDocuments;
  int? allSignDocuments;
  int? toSignDocuments;

  DocumentExchangeData(
      {this.allAssignmentDocuments,
        this.assignmentUnreadDocuments,
        this.allToViewDocuments,
        this.unreadToViewDocuments,
        this.allSignDocuments,
        this.toSignDocuments});

  DocumentExchangeData.fromJson(Map<String, dynamic> json) {
    allAssignmentDocuments = json['all_assignment_documents'];
    assignmentUnreadDocuments = json['assignment_unread_documents'];
    allToViewDocuments = json['all_to_view_documents'];
    unreadToViewDocuments = json['unread_to_view_documents'];
    allSignDocuments = json['all_sign_documents'];
    toSignDocuments = json['to_sign_documents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_assignment_documents'] = this.allAssignmentDocuments;
    data['assignment_unread_documents'] = this.assignmentUnreadDocuments;
    data['all_to_view_documents'] = this.allToViewDocuments;
    data['unread_to_view_documents'] = this.unreadToViewDocuments;
    data['all_sign_documents'] = this.allSignDocuments;
    data['to_sign_documents'] = this.toSignDocuments;
    return data;
  }
}