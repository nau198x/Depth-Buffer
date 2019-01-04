using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class DispDepth : MonoBehaviour {

	public Material material;

	void Start() {
		GetComponent<Camera>().depthTextureMode |= DepthTextureMode.Depth; // OR演算

	}

	public void OnRenderImage(RenderTexture source, RenderTexture dest) {
		Graphics.Blit(source, dest, material);
	}

}
