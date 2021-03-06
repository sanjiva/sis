<?php
namespace Institution\Controller;

use Cake\Event\Event;
use Profile\Controller\CommentsController as BaseController;

class StaffCommentsController extends BaseController
{
    public function beforeFilter(Event $event)
    {
        $page = $this->Page;
        $session = $this->request->session();
        $institutionId = $session->read('Institution.Institutions.id');
        $institutionName = $session->read('Institution.Institutions.name');
        $staffId = $session->read('Staff.Staff.id');
        $staffName = $session->read('Staff.Staff.name');

        parent::beforeFilter($event);

        // set Header
        $page->setHeader($staffName . ' - Comments');

        // set QueryString (for findIndex)
        $page->setQueryString('security_user_id', $staffId);

        // set Breadcrumb
        $this->setBreadCrumb([
            'userId' => $staffId,
            'userName' => $staffName,
            'userRole' => 'Staff',
            'institutionId' => $institutionId,
            'institutionName' => $institutionName
        ]);

        // set Tabs
        $this->setupInstitutionTabElements([
            'userId' => $staffId,
            'userName' => $staffName,
            'userRole' => 'Staff',
            'institutionId' => $institutionId
        ]);
    }

    public function add()
    {
        $page = $this->Page;
        $session = $this->request->session();

        $staffId = $session->read('Staff.Staff.id');
        $page->get('security_user_id')->setValue($staffId);

        parent::add();
    }
}
