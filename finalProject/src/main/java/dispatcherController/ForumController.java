package dispatcherController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumController {

	@RequestMapping("/ForumIndex")
	public String ForumIndex() {
		return "forum/ForumIndex";
	}
}
