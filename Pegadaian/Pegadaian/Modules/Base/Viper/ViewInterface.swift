import SVProgressHUD

protocol ViewInterface: AnyObject {
    func showLoader(withMessage message: String?)
    func dismissLoader()
    func showError(_ error: PGSError)
}

extension ViewInterface {
    func showLoader(withMessage message: String?) {
        SVProgressHUD.show(withStatus: message)
    }
    
    func dismissLoader() {
        SVProgressHUD.dismiss()
    }
    
    func showError(_ error: PGSError) {
        fatalError("Implementation pending...")
    }
}
