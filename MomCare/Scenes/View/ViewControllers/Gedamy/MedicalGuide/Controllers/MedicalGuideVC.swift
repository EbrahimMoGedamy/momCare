//
//  MedicalGuideVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/9/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class MedicalGuideVC: UIViewController {
    
    @IBOutlet weak var medicalGuide: LocalizableLabel!
    @IBOutlet weak var mostreadingLbl: LocalizableLabel!
    @IBOutlet weak var allobjectsLbl: LocalizableLabel!
    @IBOutlet weak var contactwithDrLbl: LocalizableLabel!
    @IBOutlet weak var allObjctsCollectionView: UICollectionView!
    @IBOutlet weak var marksPregnancyLbl: LocalizableLabel!
    @IBOutlet weak var doctorsCollectionView: UICollectionView!
    @IBOutlet weak var searchTxtField: UITextField!{
        didSet {
            searchTxtField.tintColor = #colorLiteral(red: 0.2235294118, green: 0.7647058824, blue: 0.8, alpha: 1)
//            searchTxtField.setIcon(#imageLiteral(resourceName: "search"))
            searchTxtField.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mostReadingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doctorsCollectionView.registerCell(cell: DoctorsCVCell.self)
        self.mostReadingCollectionView.registerCell(cell: MostReadingCVCell.self)
        self.setupCollectionView(collectionView: doctorsCollectionView)
        self.setupCollectionView(collectionView: mostReadingCollectionView)
        self.setupPaddingScrollview()
        self.setupCollectionView(collectionView: self.allObjctsCollectionView)
        self.allObjctsCollectionView.registerCell(cell: AllOfObjectsCVCell.self)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    var imagesArr = ["2018_2_24_14_19_22_952-1",
    "Eating-for-a-healthy-pregnancy-resized",
    "Nutrition-Articles---Mother-to-be",
    "133-022508-postpartum-depression-common-new-parents_700x400",
    "4126066-2012852796",
    "Nutrition-Articles---Mother-to-be-1"]
    
    var images = ["1021040990","191204091026435_كيف-اعتني-بطفلي-في-الشهر-الثاني-1","4126066-2012852796","1021040990","1021040990",]
    var descArr = ["لا ينصح بإصطحاب الطفل في رحلة خارج البلاد خلال الشهرين الأول والثاني من عمره، لأن هذه المرحلة يصعب على الأم تنظيم حياتها، وتكرس كل وقتها للطفل. مناعتهم أقوى، وينتظم نومهم بصورة أفضل، كما تكون الأم قد إستعادت عافيتها وتكيفت مع الوضع الجديد.أما في حالة السفر بعد الولادة، فقد تفاجأ الأم ببعض الأمور التي لم تضعها في إعتبارها من قبل، ولا تحسن التصرف فيها خلال السفر، فمثلاً يمكن أن تحتاج إلى أخذ الطفل للطبيب الخاص به في حالة طارئة.",
    " يحدث الحمل في فترة التبويض وهي الفترة التي يفرز فيها المبيضان البويضة، ويتم هذا في منتصف الدورة الشهرية للمرأة، التي يجري حسابها طبيًّا من أول أيام الحيض إلى اليوم الأول للحيض في الشهر التالي، حسب مدة دورتك الشهرية التي غالبًا ما تتراوح بين 24 و28 يومًا. ويحدث التبويض في اليوم 12 أو 13 أو 14 حسب مدة الدورة، ويُحسب اليومان السابقان واليومان التاليان ليوم منتصف الدورة كفترة تبويض تزيد فيها احتمالية حدوث الحمل، ويمكن أن نطلق على هذه الفترة->أيام الحمل",
    "علامات الحمل بولد يوجد جدل كبير في الأوساط الطبية حول ما إذا كان الحمل بولد أو بأنثى له علامات يمكن تمييزه من ملاحظتها، كما يشوب هذا الأمر الكثير من الخرافات والأساطير، وفيما يأتي بعض علامات الحمل بولد كما بيّنت بعض الدراسات والبحوث الإحصائية: [١] غثيان الحمل: إذا كانت الحامل لا تعاني من أعراض غثيان الحمل الصباحي فإن ذلك قد يكون أحد علامات الحمل بولد وقد دعمت بعض الدراسات الحديثة صحة هذا الأمر إلا أنه ليس مؤكدًا تمامًا بعد. معدل ضربات القلب: أشارت بعض الأوراق البحثية أن قلب الجنين الذكر ينبض بمعدل أقل من 140 نبضة في الدقيقة، ولكن لم تثبت هذا الأمر أي أبحاث أو دراسات دقيقة معتمدة. حب الشباب: ظهور البثور وحب الشباب قد يكون علامة على الحمل بولد بسبب الزيادة في مستويات هرمون التستوستيرون في دم الأم. الرغبة الشديدة في غذاء معين: من الأمور المتعارف عليها بين النساء أن الحامل بولد تبدي رغبةً كبيرة في تناول الأطعمة الحامضة أو الأطعمة المالحة، ولكن لم يتم إثبات هذا الأمر علميًا حتى هذا اليوم. تموضع البطن: يعد وضع البطن أحد العلامات الشائعة التي يمكن أن يحدد جنس المولود من خلالها، فإذا كان موضع الجنين الرحم في الأجزاء السفلية فإن هذا ثد يشير إلى الحمل بولد. تغيرات الشخصية والمزاج: يؤثر جنس الجنين في الغالب على بعض التغيرات السلوكية، ومن المرجح أن المرأة التي تتغير شخصيتها لتصبح ذات طبيعة عدوانية وجريئة ومهيمنة أثناء الحمل قد تكون حاملًا بولد، ويمكن ربط هذه التغيرات السلوكية بمستويات هرمون التستوستيرون.  لون البول: على ما يبدو فإن تغير لون البول أثناء الحمل إلى الغامق قد يكون أحد علامات الحمل بولد على الأرجح.  حجم الثدي: خلال فترة الحمل يتضخم الثدي ويزداد حجمه استعدادًا لإمداد الطفل بالحليب، ولكن بعض الاعتقادات القديمة تحكي أن زيادة حجم الثدي اليمين علامةً للحمل بولد إلا أنّ هذا الأمر لا يملك أي دليل علمي. برودة الأطراف: إن الإحساس الدائم ببرودة القدم أو اليد أثناء الحمل هو أحد مؤشرات الحمل بولد الأكيدة في معتقدات الطب الصيني. نمو الشعر: عادةً ما يزداد معدل نمو الشعر ليصبح أسرع إذا كان جنس الجنين ذكرًا. وضعية النوم: خلال فترة الحمل، غالبًا ما تشعر الحامل بالإرهاق والتعب بسهولة، وفي مثل هذه الحالة تلجأ الحامل للنوم لأوقات طويلة، وإذا نامت الحامل على الجانب الأيسر فإن ذلك قد يكون علامةً للحمل بولد. جفاف اليدين: يعتقد البعض أن جفاف وتقشر البشرة واليدين خصيصًا هو أحد علامات الحمل بولد. زيادة الوزن: يشير تمركز الوزن الزائد في المرأة الحامل إلى جنس المولود بشكل كبير، إذ يعتبر تمركز السمنة في منطقة البطن والمعدة علامةً للحمل بولد، بينما توزّع زيادة الوزن على كافة أنحاء الحسم علامةً للحمل بأنثى.",
    "التحديات : شهدت وفيات الأطفال انخفاضاً في معظم البلدان خلال العقود الماضية، ومع ذلك، فقد ظلت وفيات الأمهات والمواليد كما هي إلى حد كبير.تمثل وفيات الأطفال حديثي الولادة 40 في المائة تقريباً مما يقدر بنحو 9.7 مليون وفاة من الأطفال دون سن الخامسة، وتمثل ما يقارب 60 في المائة من وفيات الأطفال الرضع دون سنة من العمر. ويعني هذا أن احتمالات تعرض الطفل للوفاة في اليوم الأول من الحياة أكثر بحوالي 500 ضعف من احتمالات الوفاة في عمر شهر واحد. ويحدث أكبر عدد مطلق من وفيات المواليد في جنوب آسيا - وتساهم الهند بربع المجموع العالمي - ولكن أعلى المعدلات الوطنية لوفيات المواليد توجد في أفريقيا جنوب الصحراء الكبرى.وهناك عامل مشترك في هذه الوفيات هو صحة الأم. حيث تموت أكثر من 500000 امرأة كل سنة أثناء الولادة أو بسبب مضاعفات أثناء الحمل. وتكون فرص وفاة الاطفال الذين تتوفى أمهاتهم أثناء الولادة أكبر بكثير في السنة الأولى من الحياة عن الأطفال الذين تظل أمهاتهم على قيد الحياة. وتحدث تسعة وتسعين في المائة (99 في المائة) من وفيات الأمهات والأطفال حديثي الولادة في العالم النامي، حيث لا تزال أكثر من 50 في المائة من النساء يلدن دون مساعدة من عاملين صحيين مدربين. ويمثل هذا مثالاً قوياً لعدم الإنصاف والحصول على الرعاية الجيدة.وتحدث ثمانون في المائة من الوفيات النفاسية نتيجة لأسباب تتعلق مباشرة بالتوليد مثل النزيف والعدوى وارتفاع ضغط الدم في الحمل ومضاعفات الإجهاض غير الآمن. ومقابل كل امرأة تموت من المضاعفات المتعلقة بالولادة، تعاني نحو 20 امرأة أخرى من حالات الإصابة والعدوى والإعاقات والتي عادة لا تعالج ويتم تجاهلها، ويمكن لهذا أن يؤدي إلى الألم مدى الحياة والإقصاء الاجتماعي والاقتصادي. وغالبية هذه المضاعفات لا يمكن التنبؤ بها ومنعها.وجميع النساء الحوامل معرضات للخطر ويمكن أن تحدث لهن مضاعفات في أي وقت أثناء الحمل والولادة وبعد الولادة. ومع ذلك، يمكن للنساء والأسر أن تتعلم كيفية تجنب الحمل المرغوب فيه، وإذا حدثلحمل، يمكنهم أن يتعلموا أهمية تلقي الرعاية السابقة للولادة، وكيفية التعرف على علامات الخطر، والتخطيط للإحالة في حالات الطوارئ، وعمل خيارات آمنة عند الولادة. وعندما تحدث مشاكل، وتتم الإحالة في الوقت المناسب، يمكن معالجة المضاعفات في المرافق الصحية المجهزة بشكل كاف بالمستلزمات والأدوية، والتي يعمل بها فريق عمل كامل من العاملين الصحيين المدربين والمهرة.             الحلول : يعتبر تحسين الصحة والتغذية لأمهات المستقبل وتوفير خدمات الصحة الإنجابية الجيدة من الأمور الأساسية في التصدي للأسباب الكامنة وراء الكثير من وفيات الأطفال.مع حدوث حوالي 50 في المائة من وفيات المواليد في غضون 24 ساعة من الولادة، وما يصل إلى 75 في المائة في الاسبوع الأول بعد الولادة، يجب أن تركز الاستراتيجيات على نهج الرعاية المتواصلة. ويشمل هذا النهج تحسين فرص الحصول على رعاية ما قبل الولادة أثناء الحمل، وتحسين إدارة عملية الولادة الطبيعية بواسطة قابلات ماهرات، والحصول على الرعاية التوليدية الطارئة والرعاية بعد الولادة عند الحاجة إليها، وتوفير الرعاية بعد الولادة في الوقت المناسب لكل من الأمهات والمواليد. وبالإضافة إلى تعزيز الصلات بين مختلف مستويات الرعاية في المرافق الصحية، تشير الرعاية المتواصلة كذلك إلى تعزيز الروابط بين المجتمع والمرافق الصحية.وليس صحيحاً أن نفترض أن وحدات رعاية الأطفال حديثي الولادة المرتفعة التكلفة في المستشفيات هي السبيل الوحيد لعلاج الأطفال حديثي الولادة المرضى. هناك الآن أدلة تثبت أنه يمكن خفض نسبة كبيرة من وفيات وأمراض الأطفال حديثي الولادة عن طريق تنفيذ تدخلات بسيطة ومنخفضة التكلفة أثناء الولادة وخلال الأيام الأولى الحرجة والأسبوع الأول بعد الولادة، في المؤسسات والمنزل. وتشمل هذه التدخلات الأساسية تجفيف المولود والحفاظ على دفء الرضيع؛ وبدء الرضاعة الطبيعية في أقرب وقت ممكن بعد الولادة ودعم الأم لتقوم بالرضاعة الطبيعية الحصرية، وإعطاء عناية خاصة للرضع منخفضي الوزن عند الولادة، وتشخيص وعلاج مشاكل المواليد مثل الاختناق والتسمم.وتمثل معظم التدخلات الأساسية ممارسات رعاية يمكن أن توفرها الأسر بنفسها. ويمكن للأسر أيضاً أن تستعين بالعاملين الصحيين المحليين والذين يمكن أن يتواجدوا عند الولادة لرعاية الأطفال حديثي الولادة و/أو يقوموا بالزيارة مرة في غضون 24 ساعة الأولى، ومرة أو مرتين إضافيتين خلال الأسبوع الأول. حيث تحدث أكثر من 50 في المائة من وفيات المواليد في المنزل، والهدف طويل المدى وهو تدريب أعداد كافية من القابلات ليحضرن جميع الولادات لن يكون واقعاً في العديد من البلدان لسنوات قادمة. ويقدر الخبراء أن توفير هذه التدخلات الأساسية على نطاق واسع (أكثر من 90 في المائة من التغطية) في المجتمع وفي المرافق الصحية يمكن أن يقلل من معدلات وفيات المواليد بنسبة 70 في المائة.خلال العقد الماضي، تبنت اليونيسف رؤية شاملة تستند إلى الحقوق لصحة الأم. ولتحقيق هذه الغاية، تعمل اليونيسف لتعزيز دور المرأة ومنع زواج الأطفال وزيادة تعليم الفتيات والتثقيف والقضاء على ختان الإناث ودعم تطوير المهارات الحياتية لدى اليافعات. وتدعم اليونيسف تحسين رعاية ما قبل الولادة والتحصين ضد التيتانوس، وتقديم الناموسيات المعالجة بالمبيدات الحشرية، والعلاج الوقائي المتقطع، والتغذية، والوقاية من انتقال فيروس نقص المناعة البشرية من الأم إلى الطفل، وزيادة فرص حصول المرأة على علاج فيروس الأيدز. وتبعاً لاحتياجات البلد، تدعم اليونيسف أيضاً تدريب القابلات الماهرات وبرامج الرعاية التوليدية الطارئة، ومؤخراً، تدعم تحسين مبادرات رعاية المواليد ورعاية ما بعد الولادة.وقد كشفت الأدلة الحديثة، الموضحة في سلسلة لانسيت حول بقاء الطفل (2003)، وبقاء الأطفال حديثي الولادة (2005)، وبقاء الأمهات (2006) والصحة الإنجابية (2006)، عن وجود حزمة من التدخلات، إذا ما نفذت على نطاق واسع، من شأنها أن تقلل إلى حد كبير من معدل وفيات الأمهات والأطفال حديثي الولادة. وتحتاج بعض هذه التدخلات وبالذات التدخلات الخاصة بإنقاذ أرواح الأمهات، لأن تتم في مرفق رعاية توليدية أولية أو شاملة، وقد تتم الكثير من التدخلات، ولا سيما لحديثي الولادة، وأيضاً للأمهات، في المنزل من قبل العاملين الصحيين المحليين أو ممرضة زائرة.",
    "تشكل الرياضة جزءاً كبيراً من حياة الأطفال في المرحلة المدرسية. لكن هل تعلمين أن حاجات طفلك للغذاء تزداد عند ممارسته الرياضة؟إليك بعض المغذيات الأساسية التي تلعب دوراً مهماً في آداء طفلك الرياضي:    النشويات: تعتبر النشويات مصدر الطاقة الأساسي للجسم حيث يجب أن تشكل نصف أو أكثر ما يتناوله طفلك الرياضي من الغذاء. كما يجب أن يحتوي غذاؤه في معظمه على النشويات البطيئة الإمتصاص والتي تتواجد في الخبز، المعكرونة، الأرز والبطاطا لأنها تؤمن مستوى ثابتاً من سكر الدم لتكون بذلك مصدراً مستمراً وبطيئاً للطاقة اللازمة لممارسة الرياضة.ما الذي يُنصح بتناوله إذا استمر النشاط الرياضي لساعات طويلة؟إذا كان النشاط الرياضي يستمر لساعات طويلة، عندئذ يفضل أن يتناول طفلك مشروبات سكرية، الموجودة في مشروبات الرياضيين، بصورة متكررة كل 15- 20 دقيقة، مما يحافط على مخزون السكريات في كل من العضلات والكبد.  البروتين: تفيد الرياضة الجسم في بناء العضلات، لذلك تحتاج إلى البروتين. يحتاج طفلك الرياضي إلى حوالي 1 - 1.2 غ بروتين لكل كغ من وزنه، وهو ما يمكن تأمينه إذا احتوى غذاؤه على 10 - 15% من البروتينات.  كما يجب مراعاة نقطة أساسية في غذاء الطفل، وهي تنويع مصادر البروتين حيث يجب أن تشمل البروتينات الحيوانية والنباتية، فلا يقتصر غذاؤه على الخضار، بل لا بد من أن يتناول اللحوم والبيض والحليب ومشتقاته أيضاً.   فإذا تناول طفلك مثلاً كوب حليب وبيضة على الفطور، خضار مع اللحم إلى جانب الأرز على وجبة الغداء، وسندويش من الجبن على وجبة العشاء، فإنه سيكون قد حصل على حاجته الكاملة من البروتين.  الدهون: أما المواد الدهنية، فيجب أن تشكل 25 - 30% من مجمل غذاء طفلك، فالرياضة تزيد من استهلاك الدهون في الجسم، وخصوصاً في الرياضة التي يُبذل فيها جهداً بسيطاً أو متوسطاً كالتي يمارسها الأطفال باستمرار، كما يزيد استهلاك دهون الجسم كلما كانت مدة الرياضة أطول.  إذاً، يحتاج الطفل الرياضي إلى كمية معتدلة من الدهون خاصة من المصادر النباتية كزيت الزيتون، الزيتون، المكسرات والأفوكادو.    نصائح للرياضيين:  تناول وجبة غذائية قبل 2 - 3 ساعات من ممارسة الرياضة.   تناول الماء أثناء ممارسة الرياضة تناول المشروبات السكرية أثناء ممارسة الرياضة لفترة طويلة.تناول السكريات البطيئة الامتصاص بين جلسات الرياضة. ","يجب علي الاباء مساعدة الامهات في الحفاظ علي الطفل "]
    var titles = ["السفر مع الطفل الرضيع",
    "أفضل الاوقات لحدوث الحمل",
    "علامات للحمل بولد 10",
    "صحة الام والطفل",
    "التغذية والرياضة",
    "الآباء"]
    
    var titleArr = ["أنت وطفلك",
    "الرضاعة",
    "الولادة",
    "صحة الام والطفل",
    "التغذية والرياضة",
    "الآباء"]

    func cellDidTapped(sender: UIButton , url:String) {
       // self.setUrl(url: "https://www.apple.com")
        guard let url = URL(string: url) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    var objectsImages = ["191204091026435_كيف-اعتني-بطفلي-في-الشهر-الثاني-1","4126066-2012852796","1021040990","2018_2_24_14_19_22_952","Eating-for-a-healthy-pregnancy-resized","133-022508-postpartum-depression-common-new-parents_700x400"]
}
