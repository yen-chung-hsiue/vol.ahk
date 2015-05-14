#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,force
SetBatchLines, -1
coordMode,mouse,screen
coordMode,pixel,screen
coordMode,tooltip,screen
SetTitleMatchMode,2
setformat,float,0.2
SetControlDelay,-1
#SingleInstance,force

IMPAX_id:="102221"
IMPAX_pw:="a12345"
RIS_id:="102221"
RIS_pw:="a12345"
IMPAX_title:="IMPAX 6.5.2.114 Radiologist with QC"
bullet:="> "

#Hotstring EndChars -()[]{}:;'"\,.?!`n `t
/*#Include Hotstring.ahk
hotstring("i)(b?n?c?a?p?d?t?l?u?v?)(\d)=$","examTitle",3)
hotstring("i)([.\W])?(\d+)\.\.(\d+)(\W)","specifyImage",3)
hotstring("i)\b(\d+)p(\W)","pigtail",3)
hotstring("i)\b(\d+)\.(\d+)c(\W)","catheter",3)
hotstring("i)([ftpo]{2,4})9$","brainLobe",3)
hotstring("i)([apsiml]{2,3})(q?)(9)$","aspect",3)
hotstring("i)(\W)?(pcn)(\w)(\d)?(\W)","pcn",3)
hotstring("i)(\W)?(ptcd)(\w)(\d)?(\W)","ptcd",3)
hotstring("i)\b;()(l|b)(b|l|d|r|c|m)(a|p)(\d)\b","CTguide",3)
return 
*/


~!q::
;~ msgbox,1,,Quit?
;~ ifmsgbox,Cancel
	;~ return
exitapp
return

^!x::suspend  ; ctrl + alt + x

^!e:: ;ctrl + alt + e 
inputbox,addahk
if addahk!=
	fileappend,`n%addahk%,% A_ScriptFullPath
reload
return

#ifwinactive,Radiology Information System
+enter::
+numpadenter::
send {enter}%bullet%
return

#ifwinactive,ahk_class SleipnirMainWindow
~+enter::
~+numpadenter::
send %bullet%
return
#ifwinactive

newline:
if a_endchar=`n
	send {enter}%bullet%
else
	send %a_endchar%
return


:*:!{enter}::{enter}> 

; history
::hx::History: 
::r/t::radiotherapy
::c/t::chemotherapy
::lcl::localization
::xx::(非正式報告，僅供參考。){enter}

;modality

::ce::contrast enhancement
::_ctab::CT angiography scan of brain shows:`n>
::_ctpb::CT perfusion scan of brain shows:`n>
::_ctan::CT angiography of neck shows:`n>
::_ctb::CT of brain without contrast enhancement shows:`n>
::_ctbw::CT of brain without and with contrast enhancement shows:`n>
::_ctn::CT of neck without contrast enhancement shows:`n>
::_ctnw::CT of neck without and with contrast enhancement shows:`n>
::_ctbn::CT of brain and neck without contrast enhancement shows:`n>
::_ctbnw::CT of brain and neck without and with contrast enhancement shows:`n>
::_ctc::CT of chest without contrast enhancement shows:`n>
::_ctcw::CT of chest without and with contrast enhancement shows:`n>
::_cta::CT of abdomen without contrast enhancement shows:`n>
::_ctaw::CT of abdomen without and with contrast enhancement shows:`n>
::_ctap::CT of abdomen and pelvis without contrast enhancement shows:`n>
::_ctapw::CT of abdomen and pelvis without and with contrast enhancement shows:`n>
::_ctle::CT of lower extremities without contrast enhancement shows:`n>
::_ctlew::CT of lower extremities without and with contrast enhancement shows:`n>
::_ctue::CT of upper extremities without contrast enhancement shows:`n>
::_ctuew::CT of upper extremities without and with contrast enhancement shows:`n>
::_mrib::MRI of the brain without contrast enhancement shows:`n>
::_mrihand::MRI of the hand without contrast enhancement shows:`n>
::_mriknee::MRI of the knee without contrast enhancement shows:`n>
::_mrisho::MRI of the shoulder without contrast enhancement shows:`n>
::_mrispine::MRI of the lumbar spine without contrast enhancement shows:`n>{left 50}
::_mribw::MRI of the brain without contrast enhancement shows:`n>
::_mrihandw::MRI of the hand without and with contrast enhancement shows:`n>
::_mrikneew::MRI of the knee without and with contrast enhancement shows:`n>
::_mrishow::MRI of the shoulder without and with contrast enhancement shows:`n>
::_mrispinew::MRI of the lumbar spine without and with contrast enhancement shows:`n>{left 67}


::r't::right
::l't::left
::wnr::within normal range
::w/::with
::/w::without
::w/w::without/with

;image character
::hypv::hypervascular
::hypov::hypovascular
::homog::homogeneous
::hetero::heterogeneous
::si::SI
::sii::signal intensity

;generalized finding
::dz::disease
::lap::lymphadenopathy
::laps::lymphadenopathies
::postop::post-operative changes
::cal::calcification
::cals::calcifications
::ath::atherosclerotic change
::aths::atherosclerotic changes
::athc::atherosclerotic calcification
::atha::atherosclerotic calcification of the aorta.
::athac::atherosclerotic calcification of the aorta and coronary arteries.
::met::metastasis
::mets::metastases

:*:bon0::
send No obvious destructive bony lesion.
gosub newline
return

::sts::soft tissue swelling
::ln::lymph node
::lns::lymph nodes
::mth::mucosal thickening
::wth::wall thickening
::thi::thickening
::irn::irregular narrowing
::irr::irregular
::hem::hemorrhage
::nmx::
send No definite metastatic lesion in visible field. (Mx)
gosub newline
return
::lig::ligament
:*:lig1::ligaments

::nos::non-specific
::ett::a endotracheal tube
::rcvc::a right central venous catheter
::lcvc::a left central venous catheter
::rpora::a right port A catheter
::lpora::a left port A catheter
::ngt::a nasogastric tube
::fol::a Foley catheter
::cath::catheter
::pig::pigtail
:*:pigs::pigtails
::sq::subcutaneous
::thrm::thrombosis
::ddx::differential diagnosis

;brain
:*:sela0::Normal size of sellar fossa.
:*:sten0::Stenver's view showed normal size of bilateral internal auditory canals.
:*:mast0::Well pneumatization of bilateral mastoid bone. 
:*:c2c::cervicocranial arteries
::cro::craniotomy
::pal::parenchyma loss
:*:pit0::No evidence of pituitary tumor. No deviation of pituitary stalk. The posterior pituitary bright SI was preserved.
::pitu::pituitary
::pitg::pituitary gland
:*:br1::cerebrum
:*:br2::cerebellum
::wm::white matter
::gm::gray matter
::gwj::gray-white matter junction
::pvwm::periventricular white matter
::leu::leukoaraiosis
::bra::brain atrophy
::epm::encephalomalacia
:*:csf0::
send Normal appearance of sulci, fissures and ventricles.
gosub newline
return
:*:BRA0::
send Mild brain atrophy with dilated sulci, fissures and ventricles.
gosub newline
return
:*:BRA1::
send Brain atrophy with dilated sulci, fissures and ventricles.
gosub newline
return
:*:BRA2::
send Prominent brain atrophy with dilated sulci, fissures and ventricles.
gosub newline
return
::CTLEU::
send Low densities at bilateral periventricular white matter, suggestive of leukoaraiosis.
gosub newline
return
:*:CTLEU1::
send Confluent low densities at bilateral periventricular white matter, suggestive of leukoaraiosis.
gosub newline
return
::MRLEU::
send Multiple nonspecific hyperintensities over bilateral cerebral white matter on T2 FLAIR, suggestive of leukoaraiosis.
gosub newline
return
:*:MRLEU1::
send Confluent hyperintensities over bilateral cerebral white matter on FLAIR, suggestive of leukoaraiosis.
gosub newline
return
::VAU::
send Normal appearance of the cranial vault and skull base.
gosub newline
return
:*:DWI0::
send No definite focal restriction of diffusion on DWI and ADC map.
gosub newline
return
:*:TOF0::
send TOF MRA of circle of Willis appears normal.
gosub newline
return
:*:MRA0::
send Contrast enhanced MRA shows normal appearance of cervicocranial vessels.
gosub newline
return
:*:MAS0::
send Clear bilateral mastoid air cells.
gosub newline
return
:*:MAS1::Decreased pneumatization of mastoid air cells.{left 18}
gosub newline
:*:MAS2::
send Bilateral small amount mastoid effusion.
gosub newline
return
::mas::mastoid air cells
::NBE::
send No abnormal enhancing lesion in the brain parenchyma.
gosub newline
return
::NBA::
send No abnormal attenuation in the brain parenchyma.
gosub newline
return
::NBAE::
send No abnormal signal change or enhancing lesion in the brain parenchyma.
gosub newline
return
::oi::old insult
:*:oi1::old insults
::rif::recent infarct
::fro::frontal
::par::parietal
::occ::occipital
::tem::temporal

::th::thalamus
:*:th1::thalami
::bath::
send Atherosclerotic calcification of the intracranial vessels.
gosub newline
return
:*:bath0::
send Mild atherosclerotic calcification of the intracranial vessels.
gosub newline
return
::scwm::subcortical white matter
:*:MAX0::Mucus retention in maxillary sinus.{left 16}
:*:MAX1::Mucosal thickening in maxillary sinus.{left 16}
:*:MAX2::Retention cyst in maxillary sinus.{left 16}
::bg::basal ganglion
:*:bg1::basal ganglia
::intc::intracranial
::vent::ventricle
:*:vent1::ventricles
::hemi::hemisphere
::cca;::common carotid artery
:*:cca;1::common carotid arteries
::sca;::subclavian artery
:*:sca;1::subclavian arteries
::ica;::internal carotid artery
:*:ica;1::internal carotid arteries
::paic::paraclinoid ICA
::eca;::external carotid artery
:*:eca;1::external carotid arteries
::acom;::anterior communicating artery
::pcom;::posterior communicating artery
::pica;::posterior inferior cerebellar artery
::aica;::anterior inferior cerebellar artery
::va;::vertebral artery
:*:va;1::vertebral arteries
::ba;::basilar artery
::vba;::vertebrobasilar artery
::lac::lacune
:*:lac1::lacunes
:*:ctp0::CT perfusion shows symmetric cerebral perfusion.
::ptnb::patent bilateral ICA, MCA, ACA, PCA, VA, and BA.
:*:cow0::TOF MRA shows no definite vascular abnormality of the Willis circle of arteries.
::toma::TOF MRA shows
::cema::Contrast-enhanced MRA shows
::tcma::TOF MRA and contrast-enhanced MRA shows
::pds::Patent dural sinuses.
:*:tra0::No evidence of traumatic brain injury nor cervical fracture.
:*:tem0::
(
HRCT for temporal bones without contrast enhancement:
1. Normal appearance of bilateral external ear canal and middle ear osscicles.
2. Normal appearance of bilateral inner ear bony labyrinthes.
3. Well pneumatization of bilateral mastoids.
)
:*:forp::fetal origin of the right PCA
:*:folp::fetal origin of the left PCA
::fobp::fetal origin of bilateral PCA
:*:slop1::Post-operative change in the sella turcica with evidence of prior transphenoid hypophysectomy.
:*:slop2::Post-operative changes of transsphenoid pituitary adenomectomy with increased SI in the sphenoid sinus and bony defect at the sellar floor.
:*:mlsr::midline shift to the right
:*:mlsl::midline shift to the left


;neck
::djdc::degenerative change of cervical spine
::mpo::mucoperiosteal
::pnm::pneumatization
::pns::paranasal sinuses
:*:pns1::paranasal sinusitis
::sns::sinusitis
::npx::nasopharynx
:*:npx1::nasopharyngeal
::opx::oropharynx
:*:opx1::oropharyngeal
::lx::larynx
:*:lx1::laryngeal
::px::pharynx
:*:px1::pharyngeal
::ijv;::internal jugular vein
::mxy::maxillary
::mxs::maxillary sinus
:*:mxs1::maxillary sinuses
::ets::ethmoid sinus
::eth::ethmoid
::sph::sphenoid
::sps::sphenoid sinus
::thy::thyroid
::thg::thyroid gland
:*:thg1::thyroid glands
::pvst::prevertebral soft tissue
:*:rtc1::Post-RT edematous change of the retropharynegeal space and bilateral neck interstitium as well as fatty change in the C spine.
:*:rtc2::Post-RT fatty change in the C spine.
::cerv::cervical
:*:pns0::Clear paranasal sinuses.
:*:ph0::No definite mass at pharyngeal mucosal space.
::sbm::submandibular
::sbg::submandibular gland
::suc::supraclavicular
::nlap::No definite lymphadenopathy of neck.
:*:nlap0::
send Small lymph nodes (<1cm) in bilateral neck.
gosub newline
return
:*:nlap1::Enlarged lymph nodes in bilateral neck, the largest one () at {left 5}
::thn::thyroid nodule
:*:thn1::thyroid nodules

;ortho
::lcp::Legg-Calve-Perthes disease
::acl::anterior cruciate ligament
::pcl::posterior cruciate ligament
::pfj::patellofemoral joint
::tfj::tibiofemoral joint
::kj::knee joint
::mcl::medial collateral ligament
::fcl::fibular collateral ligament
::pfj::patellofemoral joint
::acj::acromioclavicular joint
::ant::anterior
::mof::marginal osteophyte(s) formation
::wdg::wedge deformity
::dch::decreased height
::comfx::compression fracture
:*:comfxs::compression fractures
::iinar::intra-articular
::cmn::comminuted
::dsp::displaced
::ndsp::non-displaced
::dpm::displacement
::fx::fracture(s)
::spc::cervical spine
::spt::thoracic spine
::spl::lumbar spine
::sptl::thoracolumbar spine
::spd::spondylosis
::ddd::degenerative disk disease
::LI::spondylolisthesis
::LI2::spondylolisthesis at L2-L3
::LI3::spondylolisthesis at L3-L4
::LI4::spondylolisthesis at L4-L5
::LI5::spondylolisthesis at L5-S1
::LID::degenerative spondylolisthesis
::LID2::degenerative spondylolisthesis at L2-L3
::LID3::degenerative spondylolisthesis at L3-L4
::LID4::degenerative spondylolisthesis at L4-L5
::LID5::degenerative spondylolisthesis at L5-S1
::LIL::spondylolytic spondylolisthesis
::LIL2::spondylolytic spondylolisthesis at L2-L3
::LIL3::spondylolytic spondylolisthesis at L3-L4
::LIL4::spondylolytic spondylolisthesis at L4-L5
::LIL5::spondylolytic spondylolisthesis at L5-S1
::lir::retrolisthesis
::msart::magnetic susceptibility artifacts
::msarts::with periprosthetic magnetic susceptibility artifacts causing image distorsion and obliteration
::oac::osteoarthritic changes
::oa1::mild osteoarthritis
::oa12::mild to moderate osteoarthritis
::oa2::moderate osteoarthritis
::oa23::moderate to severe osteoarthritis
::oa3::severe osteoarthritis
::oa14::mild osteoarthritis with small marginal osteophyte(s) at
::oa124::mild to moderate osteoarthritis with marginal osteophyte(s) and mild joint space narrowing at
::oa24::moderate osteoarthritis with marginal osteophyte(s) and joint space narrowing at
::oa234::moderate to severe osteoarthritis with marginal osteophyte(s), joint space narrowing, and mild uneven articular surface at 
::oa34::severe osteoarthritis with large marginal osteophyte(s), joint space narrowing, and uneven articular surface at
::jj::no obvious bony fracture
::nl::no evidence of dislocation or subluxation
::cst::central canal stenosis
::L11::T12-L1
::L12::L1-L2
::L23::L2-L3
::L34::L3-L4
::L45::L4-L5
::L41::L4-L5 and L5-S1
::L51::L5-S1
::L35::L3-L4 and L4-L5
::L31::L3-L4, L4-L5 and L5-S1
::C23::C2-C3
::C34::C3-C4
::C45::C4-C5
::C56::C5-C6
::C67::C6-C7
::C71::C7-T1
::sco::scoliosis
::ky::kyphosis
::lor::lordosis
::dgc::degenerative change(s)
::nsc::no abnormal prevertebral soft tissue swelling
::vb::vertebral body
::vbs::vertebral bodies
::sij::sacroiliac joint(s)
::nfn::neural foraminal narrowing
::osl::osteolytic
::osb::osteoblastic
::olma::odontoid-lateral mass asymmetry
::slj::Sinding-Larsen-Johansson disease
::ocd::osteochondritis dissicans
::_ocd::An osteochondral lesion with partial fluid cleft at lateral portion of the medial femoral condyle.
::fxsp::previous fracture(s) status post screw(s) or plate(s) fixation with suspect callus formation at
::bakercyst::
(
a cystic fluid collection at the posteromedial knee arising from between the medial gastrocnemius and the semimembranosus tendons suggesting a Baker cyst.
)
::hoffadz::edema and inflammatory changes of the fat underlying the proximal lateral patellar tendon suggesting infrapatellar fat pad impingment.
::bone0::
(
no obvious bony fracture or destructive lesion; no evidence of joint subluxation or dislocation; recommend clinical correlation. 
)
;pediatric
::intus::intussusception
::_intureduct::
(


)


;body
::spr::subphrenic
::panu::pseudoaneurysm
:*:panu1::pseudoaneurysms
:*:iiavc::IVC interruption with azygos vein continuation
::hmn::hemangioma
:*:rc/::Bilateral renal cysts.
::ifll::indeterminate focal liver lesions
::pnp::pneumoperitoneum
:*:abd0::No definite focal lesions in the GI tract, liver, spleen, pancreas, both adrenal glands and kidneys.
::lspak::No definite focal lesions in the liver, spleen, pancreas, both adrenal glands and kidneys.
::lspa::No definite focal lesions in the liver, spleen, pancreas and both adrenal glands.
::lsp::No definite focal lesions in the liver, spleen and pancreas.
::spak::No definite focal lesions in the spleen, pancreas, both adrenal glands and kidneys.
::spa::No definite focal lesions in the spleen, pancreas, both adrenal glands.
::gb::gallbladder
::sto::stomach
::cbd;::common bile duct
::ihd;::intrahepatic duct
:*:ihd;1::intrahepatic ducts
::lv::liver
::blv::both lobes of liver
::kd::kidney
:*:kd1::kidneys
::lkd::left kidney
::rkd::right kidney
::duo::duodenum
::jej::jejunum
::ilm::ileum
::icj::ileocecal junction
::icv::ileocecal valve
::ad::adrenal
:*:ad1::adrenals
::adg::adrenal gland
:*:adg1::adrenal glands
::ab::abdomen
:*:ab1::abdominal
::pel::pelvic
::pao::para-aortic
::asc::ascites
:*:sp0::spondylosis of the lumbar spine with marginal osteophyte formation.
::ph::phlebolith
:*:ph1::phleboliths
::gs::gallstones
::div::diverticulum
::div1::diverticulosis
::pan::pancreas
:*:pan1::pancreatic
::ub::urinary bladder
::per::peritoneum
:*:per1::peritoneal
::rpr::retroperitoneum
:*:rpr1::retroperitoneal
::app::appendix
:*:gi0::
send No definite obstructive lesion of the GI tracts.
gosub newline
return
::chs::cholecystitis
:*:chs1::acute cholecystitis
::aps::appendicitis
:*:aps1::acute appendicitis
::pas::pancreatitis
:*:pas1::acute pancreatitis
:*:pas2::chronic pancreatitis
::djdl::degenerative change of lumbar spine
::acol::ascending colon
::tcol::transverse colon
::dcol::descending colon
::sigc::sigmoid colon
::rect::rectum
:*:pro1::Enlarged prostate with nodular enhancement and calcification.
::cir::cirrhosis
::cct::cholecystectomy
::cy::cyst
:*:cy1::cysts
::clg::cholangiocarcinoma
::fl::fatty liver
::rcy::renal cyst
;~ :*:rcy0::Bilateral renal cysts.
:*:lc/::Multiple small cysts in both hepatic lobes.
:*:rcy1::renal cysts
::sn::spleen
::hdn::hydronephrosis
::smg::splenomegaly
::hmg::hepatomegaly

;chest
:*:ly/::(YCH/Dr.YCC)
:*:lj/::(YCH/Dr.JW)
:*:lw/::(YCH/Dr.WJL)
:*:lt/::(YCH/Dr.YHT)
:*:lc/::(YCH/Dr.CYC)
:*:lh/::(YCH/Dr.HCH)
:*:ad0::No definite abnormality of both adrenals.
::subp::subpleural
::pl::pleural
::pth::pleural thickening
::tho::thoracic
::pul::pulmonary
::lu::lung
::lin::lingular LUL
::eso::esophagus
:*:eso1::esophageal
:*:l1/::non-specific lung parenchymal change
::nh::normal heart size
::cmg::cardiomegaly
::pec::pericardial
::ggoo::ground glass opacities
::ggnn::ground glass nodule
::opa::opacity
:*:opa1::opacities
:*:comch::CT of the chest without and with contrast enhancement is read and compared with prior study dated . This CT study shows:{left 22}
::corl::Please correlate with the imaging findings and report of the abdominal/pelvic CT study.
:*:comc2::CT of the chest without and with contrast enhancement is read without prior CT for comparison. This CT study shows:
:*:comc1::CT of the chest with contrast enhancement is read and compared with prior study dated . This CT study shows:{left 22}
:*:comc0::CT of the chest without contrast enhancement is read and compared with prior study dated . This CT study shows:{left 22}
::wdgr::wedge resection
::ssa::subsegmental atelectasis
::ate::atelectasis
::brs::bronchiectasis
::pe::pleural effusion
::mdi::mediastinum
:*:mdi1::mediastinal
::ptx::pneumothorax
::con::consolidation
::emph::emphysematous change at bilateral lungs.
::bbl::bilateral basal lungs
::rull::right upper lobe
::rlll::right lower lobe
::rmll::right middle lobe
::lull::left upper lobe
::llll::left lower lobe
::djdt::degenerative change of the thoracic spine
::djdtl::degenerative change of the thoracolumbar spine
::bpk::bilateral apical pleural thickening
::cora::coronary artery
:*:cora1::coronary arteries
:*:cln0::No definite mediastinal or hilar lymphadenopathy.
::esop::esophagectomy and gastric tube reconstruction
::lbt::lobectomy
::mtt::mastectomy
::ap/::The appendix is not clearly demonstrated.
::ist::interlobular septal thickening
::pbv::peribronchovascular
::cln::centrilobular nodules
::msw::metallic sternal wires
::ao::aorta
:*:ao1::aortic
::dph::diaphragm
::tra::a tracheostomy


;intervention
::proc::procedure
::gdaa::gastroduodenal artery
::wbao::will be arranged on
::wwcf::We were consulted for
::rfa::RFA
::aspi::aspiration
::drn::drainage
::bx::biopsy
::ctg::CT-guided
::abl::ablation
::mcw::microwave
::cox::contrast extravasation
::ufg::under fluoroscopic guidance
::uug::under ultrasound guidance
::ucg::under CT guidance
::obj::obstructive jaundice
::ja::jaundice
::obu::obstructive uropathy
::apr::approach
::chg::cholangiogram



;conclusion
::nonc::(Low sensitivity and specificity of non-contrast CT.)
::sc::suggest clinical correlation.
::scf::suggest clinical correlation and follow up.
::fu::follow up
::corr::correlation
::mrc::suggest MRI correlation.
::enc::suggest endoscope correlation.
::usc::suggest ultrasound correlation.
::nn::No significant lesion. Suggest clinical correlation.
::stp::suggest tissue proof


;disease abbreviation
::htn::hypertension
:*:ca/::ca
::ca::cancer
::adc::adenocarcinoma
::car::carcinoma

;VS templates
::cyyb::
(
Brain CT without/with contrast enhancement shows:
- Hemorrhage: None
- CSF spaces: Normal in size and morphology for the patient's age
- Cerebral parenchyma: Normal
- Cerebellum: Normal
- Brainstem: Normal
- Calvarium: Normal
- Vascular system: Unremarkable
- Visualized paranasal sinuses: Clear
- Visualized orbits: Normal
- Visualized cervical spine: Normal
- Sella and skull base: Normal 
)
::cyyn::
(
Neck CT without/with contrast enhancement shows:
- Orbits/Sinonasal Cavities/Skull Base: Mild sinusitis change. 
- Nasopharynx: Normal.
- Suprahyoid Neck: Normal.
- Infrahyoid Neck: Normal.
- Thyroid: Normal.
- Lymph Nodes: Normal.
- Vascular Structures: Normal. 
)




^!r::
reload
return







;angioroom
::_pcn::
inputbox, indi, PCN indication, indication/side/chiba/pigtail`n1. indication, , 300, 150,,,,,hydronephrosis
inputbox, side, PCN side, indication/side/chiba/pigtail`n2. right or left, , 300, 150
inputbox, chiba, PCN chiba size, indication/side/chiba/pigtail`n3. 22 or 18G chiba, , 300, 150
inputbox, pig, pigtail size, indication/side/chiba/pigtail`n4. Fr and cm pigtail, , 300, 150
exam=
(
Percutaneous nephrostomy:

Indication: %indi%
Position: prone
Puncture site: %side% lateral abdomen wall, under ultrasound guidance.
Procedure:
 1). Localize, sterilize, draping, and local anesthesia at puncture site.
 2). %chiba%G Chiba needle(s) is inserted from puncture site with tip in the %side% renal pelvis.
 3). A %pig% pigtail catheter from the puncture site with tip looping in the %side% renal pelvis by Seldinger technique
 4). Turbid urine was aspirated.
 5). The pigtail catheter was fixed at abdomen wall for external drainage.
 6). Sterilize and dressing the puncture site.
Post-procedure fluroscopy showed the pigtail is looped in the renal pelvis.
The patient tolerated the procedure well without immediate complication.
)
imp=
(
Percutaneous nephrostomy is performed smoothly on the %side% kideny with %pig% pigtail(s).
Please keep external drainage.
)
send %exam% `t %imp% 
return


::_ptcd::   ;Percutaneous transhepatic cholangiodrainage
inputbox, indi, PTCD indication, indication/chiba/pigtail/cavity`n1. indication, , 300, 150,,,,, obstructive jaundice
inputbox, chiba, chiba size, indication/chiba/pigtail/cavity`n2. 22 or 18G chiba, , 300, 150,,,,,22
inputbox, pig, pigtail size, indication/chiba/pigtail/cavity`n3. Fr and cm pigtail, , 300, 150,,,,,8Fr 25cm
inputbox, cavit, cavity, indication/chiba/pigtail/cavity`n4. Right or Left IHD, , 300,150,,,,, 
inputbox, hemo, hemobilia, indication/chiba/pigtail/cavity`n5. No mild..., , 300,150,,,,,no
exam=
(
Percutaneous transhepatic cholangiodrainage

Indication: %indi%
Position: supine
Anesthesia: local anesthesia with 10ml of 2`% Xylocaine.
Procedure: 
 1). Localize, sterilize, draping, and local anesthesia at puncture site.
 2). A %chiba%G Chiba needle is inserted from puncture site under ultrasound and fluroscopy guidance
 3). A %pig% pigtail catheter is inserted into the %cavit% IHD by Seldinger technique.
 4). Turbid drainaged is aspirated.
 5). The pigtail catheter is fixed for external drainage.
 6). Sterilize and dressing the puncture site.
The patient tolerated the procedure well without definite complaints.
Complication: no immediate complication after this procedure, %hemo% hemobilia.
)
imp=
(
Under the diagnosis of %indi%, PTCD is performed smoothly with a %pig% pigtail catheter inserted into the %cavit% IHD with %hemo% hemobilia.
Please keep external drainage.
)
send %exam% `t %imp%
return


::_ptgbd::   ;Percutaneous transhepatic gallbladder drainage
indi=acute cholecystitis
posi=supine
inputbox, meth, method, method/chiba/pigtail`n1. u=echo c=CT, , 300,150,,,,,u
inputbox, chiba, chiba size, method/chiba/pigtail`n2. 22 or 18G chiba, , 300, 150,,,,,18
inputbox, pig, pigtail size, method/chiba/pigtail`n3. Fr and cm pigtail, , 300, 150,,,,,6Fr 25cm
cavit=gallbladder
if meth=u
{
 met=ultrasound and fluroscopy
 seldin=by Seldinger technique
 }
else if meth=c
{
  met=CT
  seldin=and the Chiba needle is removed
  }  
  
exam=
(
Percutaneous transhepatic gallbladder drainage

Indication: %indi%
Position: %posi%
Anesthesia: local anesthesia with 10ml of 2`% Xylocaine.
Procedure: 
 1). Localize, sterilize, draping, and local anesthesia at puncture site.
 2). A %chiba%G Chiba needle is inserted from right upper abdominal wall under %met% guidance.
 3). A %pig% pigtail catheter is inserted into the %cavit% %seldin%.
 4). Turbid drainaged is aspirated.
 5). The pigtail catheter is fixed for external drainage.
 6). Sterilize and dressing the puncture site.
The patient tolerated the procedure well without definite complaints.
Complication: no immediate complication after this procedure.
)
imp=
(
Under the diagnosis of %indi%, a %pig% pigtail catheter is inserted into the %cavit%.
Please keep external drainage.
)
send %exam% `t %imp%
return


::_pcd::   ;Percutaneous catheter drainage
inputbox, indi, PCD indication, indication/position/chiba/pigtail/cavity`n1. indication, , 300, 150
inputbox, posi, position, indication/position/chiba/pigtail`n2/cavity`n2. Supine prone..., , 300, 150
inputbox, chiba, chiba size, indication/position/chiba/pigtail/cavity`n3. 22 or 18G chiba, , 300, 150
inputbox, pig, pigtail size, indication/position/chiba/pigtail/cavity`n4. Fr and cm pigtail, , 300, 150,,,,,8Fr 25cm
inputbox, cavit, cavity, indication/position/chiba/pigtail/cavity`n5.cavity, , 300,150,,,,,%indi%
exam=
(
Percutaneous catheter drainage

Indication: %indi%
Position: %posi%
Anesthesia: local anesthesia with 10ml of 2`% Xylocaine.
Procedure: 
 1). Localize, sterilize, draping, and local anesthesia at puncture site.
 2). A %chiba%G Chiba needle is inserted from puncture site under ultrasound and fluroscopy guidance.
 3). A %pig% pigtail catheter is inserted into the %cavit% by Seldinger technique.
 4). Turbid drainaged is aspirated.
 5). The pigtail catheter is fixed for external drainage.
 6). Sterilize and dressing the puncture site.
The patient tolerated the procedure well without definite complaints.
Complication: no immediate complication after this procedure.
)
imp=
(
Under the diagnosis of %indi%, a %pig% pigtail catheter is inserted into the %cavit%.
Please keep external drainage.
)
send %exam% `t %imp%
return


::_ptcdr::  ;PTCD revision

::_CTGD::                  ;CT-guided drainage.
inputbox, indi, CTGD indication, indication/position/chiba/pigtail/cavity`n1. indication, , 300, 150
inputbox, posi, position, indication/position/chiba/pigtail`n2/cavity`n2. Supine prone..., , 300, 150
inputbox, chiba, chiba size, indication/position/chiba/pigtail/cavity`n3. 22 or 18G chiba, , 300, 150
inputbox, pig, pigtail size, indication/position/chiba/pigtail/cavity`n4. Fr and cm pigtail, , 300, 150,,,,,8Fr 25cm
inputbox, cavit, cavity, indication/position/chiba/pigtail/cavity`n5.cavity, , 300,150,,,,,%indi%
exam=
(
CT-guided drainage

Indication: %indi%
Position: %posi%
Anesthesia: local anesthesia with 10ml of 2`% Xylocaine.
Procedure: 
 1). Localize, sterilize, draping, and local anesthesia at puncture site.
 2). A %chiba%G Chiba needle is inserted from puncture site.
 3). A %pig% pigtail catheter is inserted and looped.
 4). Remove the Chiba needle.
 5). Turbid drainaged is aspirated.
 6). The pigtail catheter is fixed for external drainage.
 7). Sterilize and dressing the puncture site.
The patient tolerated the procedure well without definite complaints.
Complication: no immediate complication after this procedure.
)
imp=
(
Under the diagnosis of %indi%, a %pig% pigtail catheter is inserted into the %cavit%.
Please keep external drainage.
)
send %exam% `t %imp%
return

::_CTGb::                  ;CT-guided biopsy.
inputbox, indi, CTGD indication, indication/position/needle`n1. indication, , 300, 150
inputbox, posi, position, indication/position/needle`n2/cavity`n2. Supine prone..., , 300, 150
inputbox, needle, needle size, indication/position/needle`n3. 10vm 11G bone bipsy needle or ?G coaxial biopsy needle, , 300, 150
exam=
(
CT-guided biopsy

Indication: %indi%
Position: %posi%
Anesthesia: local anesthesia with 10ml of 2`% Xylocaine.
Procedure: 
 1). Localize, sterilize, draping, and local anesthesia at puncture site.
 2). Insert a %needle% to the %posi% (via the left transpedicular approach), under CT-guidance. Obtain xxx bone fragment, which are sent for pathology and imprint cytology studies.
 3). The patient tolerated the procedure well without definite complaints.
)

)
imp=
(
Under the diagnosis of %indi%, biopsy is performed smoothly.
Suggestion bed rest for 4 hours, and pursuit pathology reports.
)
send %exam% `t %imp%
return

::_tace::   ;TACE
inputbox, indi, TACE indication, indication/position/chiba/pigtail/cavity`n1. indication, , 300, 150,,,,,recurrent HCC
GUI, add, dropdownlist, vcath, 4Fr RC1|4Fr J curve|4Fr sim2, 
;micro, microindi
;if micro=nil  microindi=nil else  microindi=Difficult approach for selective embolization
exam=
(
Transarterial chemoembolization

Indication: %indi%
Puncture site: right trans-femoral approach by ultrasound guidance; 
Catheter: %cath%
Microcatheter: %micro% (Indication: microindi)

Angiographic findings:
- Hepatic arteries: Cork-screw change of intrahepatic vessels.
- Portal veins: Non-opacification of intrahepatic portal veins.
- Liver: 

TACE (%n%):
- Selected vessels for chemoinfusion: %emboartery%
- Chemoagent: 20mg of doxorubicin emulsified in 5 ml of lipiodol
- Embolization: Gelfoam particles until the blood flow becomes slow.
- Suggestion: Follow up liver function and watch for any possible post-TACE complication.

Follow up angiographic findings:
- No evidence of residual tumor stains in the embolized territory.
- The patient tolerated the procedure well and left the interventional suite in stable/guarded condition.

Complication:
- No complication during procedure; no hematoma formation during catheter removal.
)
return


;tempalte
::_mrikneet::
(
MRI of the knee without intravenous gadolinium contrast enhancement shows:
Menisci
Medial meniscus: Intact.
Lateral meniscus: Intact.

Ligaments
Cruciate ligaments: Intact.
Medial collateral ligament: Superficial and deep components intact. No periligamentous edema.
Lateral collateral ligament: Intact.
Posterolateral corner structures: Intact.

Fluid
Fluid No joint effusion. No Baker's cyst.

Osseous and Articular Structures
Bones: No fracture, stress reaction, or osseous lesion is seen.
Patellofemoral compartment: No hyaline cartilage disease.
Medial compartment: No hyaline cartilage disease.
Lateral compartment: No hyaline cartilage disease.

Impression
1. Normal menisci.
2. No cruciate or collateral ligament tears.
3. No osseous or cartilaginous abnormality.
)


::_mrianklet::
(
MRI of the ankle without intravenous gadolinium contrast enhancement shows:
Alignment


Medial compartment
Medial malleolus: Normal. 
Posterior tibial tendon: Normal. 
Flexor digitorum longus: Normal. 
Deltoid ligament complex - Superficial: Intact.
Deltoid ligament complex - Deep: Intact. 
Spring (plantar calcaneo-navicular) ligament: Intact. 

Lateral compartment
Lateral malleolus: Normal.
Retromalleolar groove: Flat | Concave | Convex
Peroneus longus: Normal. 
Peroneus brevis: Normal. 
Peroneal retinaculum: Intact. 
Peroneus quartus: Present. 
Anterior inferior tibiofibular ligament: Intact. 
Posterior inferior tibiofibular ligament: Intact. 
Anterior talofibular ligament: Intact. 
Calcaneofibular ligament: Intact. 
Posterior talofibular ligament: Intact. 

Posterior compartment
Posterior talus: Normal. 
Flexor hallucis longus: Normal. 
Intermalleolar ligament: Intact. 
Achilles tendon: Normal. 
Plantar fascia: Normal. 

Anterior compartment
Anterior tibial tendon: Normal.
Extensor hallucis longus: Normal. 
Extensor digitorum longus: Normal. 
Peroneus tertius: Present

Joints
Tibiotalar joint Normal. 
Subtalar joint: Normal. 
Tarsal joints: Normal. 

Other findings
Bones (other than subarticular marrow): Normal. 
Muscles: Normal. 
Tarsal tunnel: Normal. 
Sinus tarsi: Normal. 

)

/*
::pcn::
tmp:=$.value(3) 
if tmp not in l,r,b
{
    send % $.value(0)
	return
}
post=
(

No obvious discomfort was complained after the procedure.
Post-procedure vital signs: stable.
)
arr:={l:"left",r:"right",b:"bilateral"}
side:=arr[tmp]
if($.value(4)=""){  ;new PCN
exam=
(
History:

Indication: obstructive uropathy, for %side% PCN.
Catheter: 8Fr 25cm pigtail.

Findings: 

Procedure:
- Patient in prone position. Skin disinfection. Place sterile drapes.
- Fentanyl 0.05 mg IV for pain control.
- Place sterile cover on ultrasound transducer. Visualize dilated renal calyces. Local anesthesia with lidocaine 2`% 10 ml. 
- Advance 18G chiba needle into renal calyx under ultrasound.
- Remove needle stylet; aspirate some pus-like urine; inject contrast for antegrade nephrogram.
- Advance 0.035" guidewire into renal collecting system under fluoroscopic guidance.
- Nick skin with `#11 blade. Remove chiba needle.
- Advance the pigtail catheter; remove inner stiffener; position catheter in renal pelvis.
- Confirm position with contrast injection.
- Skin suture to fix the catheter.

)
	imp:="status post " side " PCN."
}else if ($.value(4)=1){ ;revision
exam=
(
History:

Indication: obstructive uropathy, for %side% PCN revision.
Catheter: 8Fr 25cm pigtail.

Procedure:
- Patient in prone position. Skin disinfection. Place sterile drapes.
- Antegrade nephrogram via previous PCN shows 
- Local anesthesia with lidocaine 2`% 10 ml.
- Advance 0.035" guidewire into renal collecting system under fluoroscopic guidance.
- Advance a new pigtail catheter; remove inner stiffener; position catheter in renal pelvis.
- Confirm position with contrast injection.
- Skin suture to fix the catheter.

)
	imp:="status post " side " PCN revision."
}
if tmp=b
	exam.="- Same steps for contralateral side."

send % exam post "`t" imp
return
ptcd:
tmp:=$.value(3) 
if tmp not in l,r,b
{
	send % $.value(0)
	return
}
post=
(

No obvious discomfort was complained after the procedure.
Post-procedure vital signs: stable.
)
arr:={l:"left",r:"right",b:"bilateral"}
side:=arr[tmp]
if($.value(4)=""){  ;new ptcd
exam=
(
History:

Indication: obstructive jaundice, for %side% PTCD revision.
Catheter: 8Fr 25cm pigtail.

Findings: 

Procedure:
- Patient in supine position. Skin disinfection. Place sterile drapes.
- Fentanyl 0.05 mg IV for pain control.
- Place sterile cover on ultrasound transducer. Visualize dilated %side% IHD. Local anesthesia with lidocaine 2`% 10 ml.  
- Advance 21G chiba needle into dilated S2 IHD under ultrasound.
- Remove needle stylet; inject small contrast aliquots under fluoroscopy to opacify the IHD.
- Advance 0.018" guidewire into IHD and exchange needle for dilator-sheath under fluoroscopy.
- Remove guidewire and dilator; perform cholangiogram via sheath.
- Advance and navigate 0.035" guidewire to CBD.
- Nick skin with `#11 blade; remove sheath.
- Advance the pigtail catheter; remove inner stiffener; position catheter in CBD.
- Confirm position and drainage function with contrast injection.
- Skin suture to fix the catheter.

)
	imp:="status post " side " PTCD."
}else if ($.value(4)=1){ ;revision
exam=
(
History:

Indication: obstructive jaundice, for %side% PTCD revision.
Catheter: 8Fr 25cm pigtail.

Procedure:
- Patient in supine position. Skin disinfection. Place sterile drapes.
- Cholangiogram via previous PTCD shows
- Advance and navigate 0.035" guidewire to CBD.
- Remove previous pigtail catheter.
- Advance a new pigtail catheter; remove inner stiffener; position catheter in %side% IHD.
- Confirm position and drainage function with contrast injection.
- Skin suture to fix the catheter.

)
	imp:="status post " side " PTCD revision."
}
if tmp=b
	exam.="- Same steps for contralateral side."

send % exam post "`t" imp
return




::_ctgb::
(
CT-guided biopsy is performed:
1. Indication: L3 lesion
2. Patient position: prone.
3. Localization, disinfection, and draping.
4. Local anesthesia with subcutaneous 2% Xylocaine 10ml.
5. Insert a 10 cm and 11G bone biopsy needle to the L3 vertebral body via the left transpedicular approach, under CT-guidance. Obtain 2 bone fragment, which are sent for pathology and imprint cytology studies.
6. The patient tolerates the procedure well without definite complication. No hemorrhage is noted on the post-procedural CT images.
7. Suggestion: supine bed rest for 4 hours, and pursuit pathology reports.
)

::_ptgbd::
(
Indication: Acute cholecystitis.
Procedure name: PTGBD.
Catheters/needles: 18G chiba needle, 8Fr-25cm pigtail.
Other materials: nil.
Approach site: Percutaneous approach after sterilization
Procedure findings:
> Abdominal ultrasound showed wall thickening of the GB and GB stones.
> We navigated the 18G chiba needle into GB via echo guide. 
> We advanced the guide wire into the GB via the chiba needle and exchanged the chiba needle with the pigtail by Seldinger technique.
> Post PTCCD cholangiogram showed smooth passage and drainage of the contrast via the PTCCD. GB stones was also noted.

Suggestion: 
> Follow up the clinical condition.
> Keep antibiotic treatment.
> Keep external drainage.
)

::_ptcd::
(
Indication: Obstructive jaundice
Procedure name: PTCD.
Catheters/needles: 22G chiba needle, 18G chiba needle, 8Fr-25cm pigtail.
Other materials: nil.
Approach site: Percutaneous approach after sterilization
Procedure findings:
> Abdominal ultrasound showed dilated intrahepatic duct.
> We navigated the 22G chiba needle into right/left intrahepatic duct. 
> We advanced the guidewire into the IHD via the chiba needle and inserted dilator over the guidewire.
> The dilator is exchanged with the pigtail by Seldinger technique.
> Cholangiogram showed well opacification of the bilateral!! IHD and well drainage function.

Suggestion: 
> Follow up the clinical condition.
> Keep external drainage.
)
*/
